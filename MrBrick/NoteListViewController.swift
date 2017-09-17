//
//  NoteListViewController.swift
//  MrBrick
//
//  Created by Xueliang Chen on 9/12/17.
//  Copyright © 2017 Conceptual. All rights reserved.
//

import UIKit
import CoreData

class NoteListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate {
    
    var notes = [Note]()
    
    
    var fetchedResultsController: NSFetchedResultsController<Note>?
    
    func initializeFetchedResultController()->NSFetchedResultsController<Note>{
        let request:NSFetchRequest<Note> = Note.fetchRequest()
        let primarySortDescriptor = NSSortDescriptor(key: "updateDate", ascending: true)
        let secondarySortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        
        request.sortDescriptors = [primarySortDescriptor,secondarySortDescriptor]
        
        let frc = NSFetchedResultsController<Note>(fetchRequest: request, managedObjectContext: DatabaseController.getContext(), sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        
        return frc
    }
    
    @IBOutlet weak var MainList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //InitData()
        //PrepareData()
        
        fetchedResultsController = initializeFetchedResultController()
        do{
            try fetchedResultsController?.performFetch()
        }
        catch{
            fatalError("can not performfetch")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController?.sections else{
            fatalError("no sections in fetchedResultsController")
        }
        let sectionInfo = sections[section]
        
        return sectionInfo.numberOfObjects
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SingleNoteTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SingleNoteTableViewCell
            else{
                fatalError("failed.")
        }
//        let currentNote = notes[indexPath.row]
//        cell.note = currentNote
//        cell.noteTitleLabel.text = currentNote.title
//        cell.noteContentTextView.text = currentNote.content
        
        let currentNote = fetchedResultsController?.object(at: indexPath) as! Note
        cell.noteTitleLabel.text = currentNote.title
        cell.noteContentTextView.text = currentNote.content
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return (fetchedResultsController?.sections?.count)!
    }
    
    //comunication
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        MainList.beginUpdates()
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type{
        case .insert:
            MainList.insertSections(IndexSet(integer:sectionIndex), with: .fade)
        case .delete:
            MainList.deleteSections(IndexSet(integer:sectionIndex), with: .fade)
        case .move:
            break
        case .update:
            break
        }
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            MainList.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            MainList.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            MainList.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            MainList.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        MainList.endUpdates()
    }
    
    
    private func PrepareData()
    {
        let fetchRequest:NSFetchRequest<Note> = Note.fetchRequest()
        
        do{
            let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
            
            notes = searchResults as [Note]
        }
        catch{
            
        }
        
    }
    private func InitData(){
        let note:Note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: DatabaseController.getContext())
        as! Note
        note.title = "Winter air"
        note.content = "this season is never be changed"
        note.updateDate = NSDate()
        
        DatabaseController.saveContext()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch (segue.identifier ?? "") {
            
        case "showNoteDetail":
            //let navController = segue.destination as! UINavigationController
            //let destController = navController.topViewController as! NoteDetailViewController
            
            let destController = segue.destination as! NoteDetailViewController
            let orgCell = sender as! SingleNoteTableViewCell
            
            destController.note = orgCell.note
            destController.noteTitle = orgCell.noteTitleLabel.text
            destController.noteContent = orgCell.noteContentTextView.text
            
        case "createNote":
            let destController = segue.destination as! NoteDetailViewController
            
            let newNote:Note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: DatabaseController.getContext())
                as! Note
            newNote.title = ""
            newNote.content = ""
            newNote.updateDate = NSDate()
            
            destController.note = newNote
            DatabaseController.saveContext()
            
        default:
            fatalError("unexpected segue identifier")
        }

    }

    @IBAction func BuildANewData(_ sender: Any) {
        let note:Note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: DatabaseController.getContext())
            as! Note
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "dd-MM-yyyy"
        let myStringFD = formatter.string(from: yourDate!)
        
        note.title = myStringFD
        note.content = "this season is never be changed"
        note.updateDate = NSDate()
        
        DatabaseController.saveContext()
    }
    
    @IBAction func ConvertToEditModel(_ sender: Any) {
        
        MainList.setEditing(!MainList.isEditing, animated: true)
        (sender as! UIBarButtonItem).title = MainList.isEditing ? "Done":"Edit"
        
        InitData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        navigationItem.leftBarButtonItem?.title = "check"
        
        if editingStyle == .delete{
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
}

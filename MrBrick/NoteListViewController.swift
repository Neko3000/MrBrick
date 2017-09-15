//
//  NoteListViewController.swift
//  MrBrick
//
//  Created by Xueliang Chen on 9/12/17.
//  Copyright © 2017 Conceptual. All rights reserved.
//

import UIKit
import CoreData

class NoteListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var notes = [Note]()
    
    @IBOutlet weak var MainList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //InitData()
        PrepareData()
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
        return notes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SingleNoteTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SingleNoteTableViewCell
            else{
                fatalError("failed.")
        }
        let note = notes[indexPath.row]
        cell.noteTitleLabel.text = note.title
        cell.noteContentTextView.text = note.content
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    private func PrepareData()
    {
        //let note1 = Note(title:"My first day",content:"enjoy it!",updatedTime:Date())
        //let note2 = Note(title:"My second day",content:"fail it!",updatedTime:Date())
        
        let fetchRequest:NSFetchRequest<Note> = Note.fetchRequest()
        
        do{
            let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
            
            notes = searchResults as [Note]
            
            for singleNote in searchResults as [Note]{
                 print("\(singleNote.title)")
            }
        }
        catch{
            
        }
        
    }
    private func InitData(){
        let note:Note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: DatabaseController.getContext())
        as! Note
        note.title = "Summer air"
        note.content = "why we just come back"
        note.updateDate = NSDate()
        
        DatabaseController.saveContext()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showNoteDetail")
        {
            //let navController = segue.destination as! UINavigationController
            
            //let destController = navController.topViewController as! NoteDetailViewController
            let destController = segue.destination as! NoteDetailViewController
            let orgCell = sender as! SingleNoteTableViewCell
            
            destController.noteTitle = orgCell.noteTitleLabel.text
            destController.noteContent = orgCell.noteContentTextView.text
        }
    }
}

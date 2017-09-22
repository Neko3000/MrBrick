//
//  NoteDetailViewController.swift
//  MrBrick
//
//  Created by Xueliang Chen on 9/12/17.
//  Copyright © 2017 Conceptual. All rights reserved.
//

import UIKit
import CoreData

class NoteDetailViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {

    var note:Note?
    
    private var _noteTitle:String?
    private var _noteContent:String?
    
    var noteTitle:String?
    {
        get{
            return _noteTitle
        }
        set{
            _noteTitle = newValue
        }
    }
    var noteContent:String?
    {
        get{
            return _noteContent
        }
        set{
            _noteContent = newValue
        }
    }
    
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    @IBOutlet weak var noteContentTextView: UITextViewFixed!
    
    @IBOutlet weak var stretchBox: StretchBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        noteTitleTextField.text = note?.title
        noteContentTextView.text = note?.content
        
        stretchBox.addBottomLine(width: stretchBox.lineWidth, color: stretchBox.lineColor, ratio: (noteTitleTextField.text?.characters.count)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        note?.content = textView.text
        
        DatabaseController.saveContext()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        note?.title = textField.text
        
        DatabaseController.saveContext()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

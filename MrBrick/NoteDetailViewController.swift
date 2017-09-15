//
//  NoteDetailViewController.swift
//  MrBrick
//
//  Created by Xueliang Chen on 9/12/17.
//  Copyright © 2017 Conceptual. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

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
    
    
    @IBOutlet weak var noteTitleLabel: UITextFieldLineStyle!
    
    @IBOutlet weak var noteContentTextView: UITextViewFixed!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        noteTitleLabel.text = _noteTitle
        noteContentTextView.text = _noteContent
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

}

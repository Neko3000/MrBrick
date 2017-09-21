//
//  SingleNoteTableViewCell.swift
//  MrBrick
//
//  Created by Xueliang Chen on 9/10/17.
//  Copyright © 2017 Conceptual. All rights reserved.
//

import UIKit

class SingleNoteTableViewCell: UITableViewCell {
    
    var note:Note?
    
    @IBOutlet weak var noteTitleLabel: UILabel!
    @IBOutlet weak var noteContentTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        noteContentTextView.textContainer.maximumNumberOfLines = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

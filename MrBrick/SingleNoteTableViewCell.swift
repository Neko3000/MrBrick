//
//  SingleNoteTableViewCell.swift
//  MrBrick
//
//  Created by Xueliang Chen on 9/10/17.
//  Copyright © 2017 Conceptual. All rights reserved.
//

import UIKit

class SingleNoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Content: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  File.swift
//  MrBrick
//
//  Created by Xueliang Chen on 9/10/17.
//  Copyright © 2017 Conceptual. All rights reserved.
//

import Foundation
import UIKit

class Note{
    
    var title:String = ""
    var content:String? = ""
    var updatedTime:Date
    
    init?(title:String, content:String?, updatedTime:Date) {
        self.title = title
        self.content = content
        self.updatedTime = updatedTime
    }
    
}

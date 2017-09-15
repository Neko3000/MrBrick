//
//  Note+CoreDataProperties.swift
//  MrBrick
//
//  Created by Xueliang Chen on 9/15/17.
//  Copyright © 2017 Conceptual. All rights reserved.
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var content: String?
    @NSManaged public var title: String?
    @NSManaged public var updateDate: NSDate?

}

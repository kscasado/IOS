//
//  Note.swift
//  CoolNotesApp
//
//  Created by Kevin Casado on 7/14/16.
//  Copyright © 2016 Kevin Casado. All rights reserved.
//

import Foundation
import CoreData


class Note: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init(text:String = "New Note", context:NSManagedObjectContext){
        if let ent = NSEntityDescription.entityForName("Note", inManagedObjectContext: context){
            self.init(entity:ent, insertIntoManagedObjectContext:context)
            self.text = text
            self.creationDate = NSDate()
        }
        else{
            fatalError("Unable to find entity name")
        }
    }
    var humanReadableAge: String{
        get{
            let fmt = NSDateFormatter()
            fmt.timeStyle = .NoStyle
            fmt.dateStyle = .ShortStyle
            fmt.doesRelativeDateFormatting = true
            fmt.locale = NSLocale.currentLocale()
            return fmt.stringFromDate(creationDate!)
        }
    }

}

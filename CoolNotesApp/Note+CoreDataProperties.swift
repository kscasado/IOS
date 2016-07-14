//
//  Note+CoreDataProperties.swift
//  CoolNotesApp
//
//  Created by Kevin Casado on 7/14/16.
//  Copyright © 2016 Kevin Casado. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Note {

    @NSManaged var creationDate: NSDate?
    @NSManaged var text: String?
    @NSManaged var notebook: NSManagedObject?

}
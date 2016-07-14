//
//  NotebooksTableViewController.swift
//  CoolNotesApp
//
//  Created by Kevin Casado on 7/14/16.
//  Copyright © 2016 Kevin Casado. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class NotebooksTableViewController: CoreDataTableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cool Notes"
        
        // Get the stack
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let stack = delegate.stack

        // Create a fetchrequest
        let fr = NSFetchRequest(entityName: "Notebook")
        fr.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true),
                              NSSortDescriptor(key: "creationDate", ascending: false)]
        
        // Create the FetchedResultsController
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr,
                                                              managedObjectContext: stack!.context, sectionNameKeyPath: nil, cacheName: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let nb = fetchedResultsController!.objectAtIndexPath(indexPath) as! Notebook
        let cell = tableView.dequeueReusableCellWithIdentifier("NotebookCell",forIndexPath: indexPath)
        
        cell.textLabel?.text = nb.name
        cell.detailTextLabel?.text = "(\(nb.notes!.count) notes"
        
        return cell
    }
}
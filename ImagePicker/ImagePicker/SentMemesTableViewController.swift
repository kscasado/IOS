//
//  SentMemesViewController.swift
//  ImagePicker
//
//  Created by Kevin Casado on 7/13/16.
//  Copyright © 2016 Kevin Casado. All rights reserved.
//

import Foundation
import UIKit


class SentMemesTableViewController: UITableViewController,UINavigationControllerDelegate
{
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SentMemeCell")!
        let meme = self.memes[indexPath.row]
        
        // Set the name and image
        
        cell.imageView?.image = meme.memeImage
        
        // If the cell has a detail label, we will put the evil scheme in.
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
       
       
        
        
    }

}
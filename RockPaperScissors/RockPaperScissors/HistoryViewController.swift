//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Kevin Casado on 7/7/16.
//  Copyright © 2016 Kevin Casado. All rights reserved.

import Foundation
import UIKit

class HistoryViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var history: [RoshamboMatch]!
    
    // Table View Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CellID = "HistoryCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CellID, forIndexPath: indexPath)
        
        let match = self.history[indexPath.row]
        
        cell.textLabel!.text = victoryStatusDescription(match)
        cell.detailTextLabel!.text = "\(match.player) vs. \(match.cpu)"
        
        
        return cell
    }
    
    func victoryStatusDescription(match: RoshamboMatch) -> String {
        
        if (match.tie) {
            return "Tie."
        } else if (match.winner==match.cpu){
            return "Loss."
        }
         else {
            return "Win."
        }
    }
    @IBAction func dismissHistory(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

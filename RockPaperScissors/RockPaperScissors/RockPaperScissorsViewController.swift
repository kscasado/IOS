//
//  RockPaperScissorsViewController.swift
//  Roshambo
//
//  Created by Kevin on 7/7/16.
//  Copyright © 2016 Kevin Casado. All rights reserved.



import UIKit

class RockPaperScissorsViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    var match: RoshamboMatch!
    var history = [RoshamboMatch]()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //Notice that this code works for both Scissors and Paper
        let controller = segue.destinationViewController as! ResultViewController
        controller.match = self.match
        
    }

    @IBAction func makeYourMove(sender: UIButton) {
        
        switch (sender) {
        case self.rockButton:
            throwDown(RoshamboEnum.Rock)
            
        case self.paperButton:
            throwDown(RoshamboEnum.Paper)

        case self.scissorsButton:
            throwDown(RoshamboEnum.Scissors)
        
        default:
            assert(false, "An unknown button is invoking makeYourMove()")
        }
    }
    
    func throwDown(playersMove: RoshamboEnum)
    {
        
        let computersMove = RoshamboEnum()
        self.match = RoshamboMatch(player: playersMove, cpu: computersMove)
         history.append(match)
       
        if (playersMove == RoshamboEnum.Rock) {
           
            let storyboard = UIStoryboard (name: "Main", bundle: nil)
            let resultVC = storyboard.instantiateViewControllerWithIdentifier("ResultViewController")as! ResultViewController
        
           
            resultVC.match = self.match
            self.navigationController?.pushViewController(resultVC, animated: true)
        }
        
        else if (playersMove == RoshamboEnum.Paper) {
            
            performSegueWithIdentifier("throwDownPaper", sender: self)
        }
        
        
        
    }
   
    @IBAction func showHistory(sender: AnyObject) {
        
        let storyboard = self.storyboard
        let controller = storyboard?.instantiateViewControllerWithIdentifier("HistoryViewController")as! HistoryViewController
        
        controller.history = self.history
        
        self.presentViewController(controller, animated: true, completion: nil)
    }


}
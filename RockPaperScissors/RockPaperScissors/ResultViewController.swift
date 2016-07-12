//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Kevin on 7/7/16.
//  Copyright © 2016 Kevin Casado. All rights reserved.

//

import UIKit

class ResultViewController: UIViewController {
        @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    var history: [RoshamboMatch]!
    var match: RoshamboMatch!
   
    
    var message: NSString!
    var  picture: UIImage!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewWillAppear(animated:Bool)
    {
        super.viewWillAppear(animated)
        self.messageLabel.text = messageForMatch(match)
        self.resultImageView.image = imageForMatch(match)
    }

    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)

        UIView.animateWithDuration(1.5)
        {
            self.resultImageView.alpha = 1;
        }
    }
    
    @IBAction func playAgainButtonPressed(sender: AnyObject)
    {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func messageForMatch(match: RoshamboMatch) -> String {
        
        // Handle the tie
        if match.tie{
            return "It's a tie!"
        }
        
        return match.winner.description + " " + victoryModeString(match.winner) + " " + match.loser.description + ". " + resultString(match)
    }
    
    func resultString(match: RoshamboMatch) -> String {
        if(match.player>match.cpu){
            return "You Win!"
        }
        else{
            return "You Lose!"
        }
        
    }
    
    
    func victoryModeString(gesture: RoshamboEnum) -> String {
        switch (gesture) {
        case .Rock:
            return "crushes"
        case .Scissors:
            return "cuts"
        case .Paper:
            return "covers"
        }
    }
    
    func imageForMatch(match: RoshamboMatch) -> UIImage {
        
        var name = ""
        
        switch (match.winner) {
        case .Rock:
            name = "RockCrushesScissors"
        case .Paper:
            name = "PaperCoversRock"
        case .Scissors:
            name = "ScissorsCutPaper"
        }
        
        if match.player == match.cpu {
            name = "itsATie"
        }
        return UIImage(named: name)!
    }
}

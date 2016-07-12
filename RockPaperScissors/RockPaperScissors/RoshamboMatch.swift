//
//  RoshamboMatch
//  RockPaperScissors
//
//  Created by Kevin on 7/7/16.
//  Copyright © 2016 Kevin Casado. All rights reserved.

import Foundation


struct RoshamboMatch {
    
    let player: RoshamboEnum
    let cpu: RoshamboEnum
    
   
    init( player: RoshamboEnum,  cpu: RoshamboEnum) {
        self.player = player
        self.cpu = cpu
    }
    
    var winner: RoshamboEnum {
        if(player>cpu){
            return player;
            
        }
        else{
            return cpu;
        }
    }
    
    var loser: RoshamboEnum {
        if(player<cpu){
            return player;
        }
        else{
            return cpu;
        }
    }
    var tie: Bool{
        if(player==cpu){
            return true;
        }
        else{
            return false;
        }
    }
}
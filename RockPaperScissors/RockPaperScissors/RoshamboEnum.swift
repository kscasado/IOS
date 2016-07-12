//
//  Roshambo
//  RockPaperScissors
//
//  Created by Kevin on 7/7/16.


import Foundation

enum RoshamboEnum: Comparable {
    case Rock, Paper, Scissors

    init() {
        switch arc4random() % 3 {
        
        case 0:
            self = .Rock
        case 1:
            self = .Paper
        default:
            self = .Scissors
        }
    }
}

func <(lhs: RoshamboEnum, rhs: RoshamboEnum) -> Bool {
    
    switch (lhs, rhs) {
    case (.Rock, .Paper), (.Paper, .Scissors), (.Scissors, .Rock):
        return true;
    default:
        return false;
    }
}

extension RoshamboEnum: CustomStringConvertible {
    
    var description: String {
        get {
            switch (self) {
            case .Rock:
                return "Rock"
            case .Paper:
                return "Paper"
            case .Scissors:
                return "Scissors"
            }
        }
    }
}


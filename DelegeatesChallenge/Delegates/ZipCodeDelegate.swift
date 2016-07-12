//
//  ZipCodeDelegate.swift
//  DelegeatesChallenge
//
//  Created by Kevin Casado on 6/28/16.
//  Copyright © 2016 Kevin Casado. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeDelegate : NSObject , UITextFieldDelegate {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var newText: NSString = textField.text!
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        if newText.length > 5{
            
            return false
        }
        return true
        
    }
    
    
    
}
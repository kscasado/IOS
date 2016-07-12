//
//  CurrencyDelegate.swift
//  DelegeatesChallenge
//
//  Created by Kevin Casado on 6/28/16.
//  Copyright © 2016 Kevin Casado. All rights reserved.
//

import Foundation
import UIKit

class CurrencyDelegate : NSObject , UITextFieldDelegate {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var oldText = textField.text! as NSString
        var newString = oldText.stringByReplacingCharactersInRange(range, withString: string) as NSString
        print(newString)
        
       
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        var dollars = (NSString(string: newString).doubleValue)/100
        print(dollars)
        newString = formatter.stringFromNumber(dollars)!
        
        textField.text = newString as String
        
        
        return false
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        //textField.text = "$0.00"
    }
    
    
}
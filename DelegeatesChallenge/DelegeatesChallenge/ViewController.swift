//
//  ViewController.swift
//  DelegeatesChallenge
//
//  Created by Kevin Casado on 6/28/16.
//  Copyright © 2016 Kevin Casado. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var zipCodeField: UITextField!

    @IBOutlet weak var changeField: UITextField!
    @IBOutlet weak var lockedTextField: UITextField!
    
    @IBOutlet weak var lock: UISwitch!
    @IBOutlet weak var lockSwitch: UIStackView!
    let zipCodeDelegate = ZipCodeDelegate()
    let currencyDelegate = CurrencyDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.zipCodeField.delegate = zipCodeDelegate
        self.changeField.delegate = currencyDelegate
        self.lockedTextField.delegate = self
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if lock.on{
            return false
        }
        return true
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


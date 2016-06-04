
//
//  SettingsViewController.swift
//  AppWeather
//
//  Created by Bonnet Rémi on 04/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import Foundation

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameText: UILabel!
    
    var nameUser = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if nameTextField != nil {
            nameTextField.delegate = self
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameText.text = textField.text
    }
    
}

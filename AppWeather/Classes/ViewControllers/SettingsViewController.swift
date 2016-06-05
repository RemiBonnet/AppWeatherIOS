
//
//  SettingsViewController.swift
//  AppWeather
//
//  Created by Bonnet Rémi on 04/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import Foundation
import UIKit
import BEMCheckBox

var city = ""

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameText: UILabel!
    @IBOutlet weak var manCheckBox: BEMCheckBox!
    @IBOutlet weak var womanCheckBox: BEMCheckBox!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var nameText: UILabel!
    
    @IBOutlet weak var label: UILabel!
    
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
        // Todo parse name
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        nameText?.text! = "test"
    }
    
    @IBAction func setNameTapped(sender: AnyObject) {
        print("test")
        nameText?.text! = "test"
    }
    
    
    
    // MARK: Checkbox
        // TODO condition to have sexe
    func checkBox() {
        
    }
    
    // MARK: City
    @IBAction func setCityTapped(sender: UIButton) {
        city = "\(cityTextField.text)"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "rootView" {
            let rootViewController: RootViewController = segue.destinationViewController as! RootViewController
            rootViewController.recevedCity = cityTextField.text!
        }
    }
    
}

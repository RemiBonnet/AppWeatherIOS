//
//  settingsViewController.swift
//  AppWeather
//
//  Created by Bonnet Rémi on 11/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var textSettings: UITextView!
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderController: UISegmentedControl!
    
    
    var user = NSUserDefaults()
    var receivedCity: String = ""
    var receivedName: String = ""
    var receivedGender: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // Data user
        let receivedName = user.objectForKey("name_default")  as! String
        let receivedCity = user.objectForKey("city_default") as! String
        
        // Title
        textSettings.font = UIFont(name: "BrandonGrotesque-Black", size: 25)
        
    
        // City
        cityTextField.text = "\(receivedCity.uppercaseString)"
        cityTextField.font = UIFont(name: "BrandonGrotesque-Bold", size: 18)
        cityLabel.font = UIFont(name: "BrandonGrotesque-Bold", size: 18)
        
        if cityTextField != nil {
            cityTextField.delegate = self
        }
        
        // Name
        nameTextField.text = "\(receivedName.uppercaseString)"
        nameTextField.font = UIFont(name: "BrandonGrotesque-Bold", size: 18)
        nameLabel.font = UIFont(name: "BrandonGrotesque-Bold", size: 18)
        
        if nameTextField != nil {
            nameTextField.delegate = self
        }
        
        // Gender
//        genderTextField.text = "\(receivedGender.uppercaseString)"
//        genderTextField.font = UIFont(name: "BrandonGrotesque-Bold", size: 18)
        if (receivedGender == "man") {
//            genderController.addTarget(self, action: Selector("segmentedValueChanged:"), forControlEvents:.TouchUpInside)
            self.view.addSubview(genderController)
        } else {
            genderController.selectedSegmentIndex == 1
        }
        genderLabel.font = UIFont(name: "BrandonGrotesque-Bold", size: 18)

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    // MARK: Action
    @IBAction func actionCity(sender: UITextField) {
        receivedCity = cityTextField.text!
        user.setObject(receivedCity, forKey: "city_default")
    }
    @IBAction func actionName(sender: UITextField) {
        receivedName = nameTextField.text!
        user.setObject(receivedName, forKey: "name_default")
    
    }
    
    @IBAction func actionGender(sender: AnyObject) {
        
        if (genderController.selectedSegmentIndex == 0) {
            receivedGender = "man"
            user.setObject(receivedGender, forKey: "gender_default")
        } else if (genderController.selectedSegmentIndex == 1) {
            receivedGender = "woman"
            user.setObject(receivedGender, forKey: "gender_default")
        }
        print(receivedGender)
        
        
        
    }
    
}

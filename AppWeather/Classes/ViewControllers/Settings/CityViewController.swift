//
//  CityViewController.swift
//  AppWeather
//
//  Created by Bonnet Rémi on 06/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import Foundation
import UIKit

class CityViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var cityUserTextField: UITextField!
    
    var user = NSUserDefaults()
    var receivedName: String = ""
    var receivedGender: String = ""
    var receivedCity: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional) setup after loading the view, typically from a nib.
        if cityUserTextField != nil {
            cityUserTextField.delegate = self
        }
        
        user.setObject(receivedName, forKey: "name_default")
        user.setObject(receivedGender, forKey: "gender_default")
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
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func tappedCityAction(sender: AnyObject) {
        receivedCity =  cityUserTextField.text!
        user.setObject(receivedCity, forKey: "city_default")
    }
}

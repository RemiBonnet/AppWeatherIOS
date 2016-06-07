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
    
    var receivedName: String = ""
    var receivedGender: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional) setup after loading the view, typically from a nib.
        if cityUserTextField != nil {
            cityUserTextField.delegate = self
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
        self.view.endEditing(true)
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "cityIdentifier") {
            let rootViewController: RootViewController = segue.destinationViewController as! RootViewController
            
            rootViewController.receivedCity = cityUserTextField.text!
            rootViewController.receivedGender = receivedGender
            rootViewController.receivedName = receivedName
        }
    }
    
}

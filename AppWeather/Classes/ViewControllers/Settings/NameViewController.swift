//
//  nameViewController.swift
//  AppWeather
//
//  Created by Bonnet Rémi on 06/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import Foundation
import UIKit

class NameViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameUserTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if nameUserTextField != nil {
            nameUserTextField.delegate = self
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
        if (segue.identifier == "nameIdentifier") {
            let genderViewController: GenderViewController = segue.destinationViewController as! GenderViewController
            genderViewController.receivedName = nameUserTextField.text!
        }
    }
}



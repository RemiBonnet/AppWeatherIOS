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
    var user = NSUserDefaults()
    var checkName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        let color1 = UIColor.hllTwilightBlueColor().CGColor as CGColorRef
        let color2 = UIColor.hllLightTealColor().CGColor as CGColorRef
        
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0.1, 1.0]
        
        gradientLayer.frame = self.view.bounds
        
        
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        if nameUserTextField != nil {
            nameUserTextField.delegate = self
        }
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        let checkName = user.objectForKey("name_default")
        
        if (checkName != nil) {
            print("check\(checkName)")
            
            let a = UIStoryboard(name: "Main", bundle: nil)
            let b = a.instantiateViewControllerWithIdentifier("MYNAV") as? UINavigationController
            
            self.presentViewController(b!, animated: true, completion: {
                
            })
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



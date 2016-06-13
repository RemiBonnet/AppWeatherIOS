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
    
    @IBOutlet weak var leastLabel: UILabel!
    @IBOutlet weak var findLabel: UILabel!
    @IBOutlet weak var cityUserTextField: UITextField!
    @IBOutlet weak var geoButton: UIButton!
    
    var user = NSUserDefaults()
    var receivedName: String = ""
    var receivedGender: String = ""
    var receivedCity: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional) setup after loading the view, typically from a nib.
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        let color1 = UIColor.hllTwilightBlueColor().CGColor as CGColorRef
        let color2 = UIColor.hllLightTealColor().CGColor as CGColorRef
        
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0.1, 1.0]
        
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        
        if cityUserTextField != nil {
            cityUserTextField.delegate = self
        }
        
        user.setObject(receivedName, forKey: "name_default")
        user.setObject(receivedGender, forKey: "gender_default")
        
        cityUserTextField.font = UIFont(name: "BrandonGrotesque-Regular", size: 24)
        leastLabel.font = UIFont(name: "BrandonGrotesque-Black", size: 30)
        findLabel.font = UIFont(name: "BrandonGrotesque-Medium", size: 19)
        geoButton.titleLabel!.font = UIFont(name: "BrandonGrotesque-Black", size: 15)
        
        geoButton.layer.borderWidth = 1;
        geoButton.layer.borderColor = UIColor.whiteColor().CGColor
        geoButton.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.1)
        


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

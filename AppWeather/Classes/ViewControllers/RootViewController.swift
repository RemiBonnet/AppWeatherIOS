//
//  RootViewController.swift
//  AppWeather
//
//  Created by Bonnet Rémi on 01/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    // MARK: Properties
    var user = NSUserDefaults()
    var receivedName: String = ""
    var receivedGender: String = ""
    var receivedCity: String = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let receivedName = user.objectForKey("name_default")  as! String
        let receivedGender = user.objectForKey("gender_default") 
        let receivedCity = user.objectForKey("city_default") as! String
        
        print("RootView -> Name:\(receivedName)")
        print("RootView -> Gender:\(receivedGender)")
        print("RootView -> City:\(receivedCity)")
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        let color1 = UIColor.hllTwilightBlueColor().CGColor as CGColorRef
        let color2 = UIColor.hllLightTealColor().CGColor as CGColorRef
        
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0.1, 1.0]
        
        gradientLayer.frame = self.view.bounds
        
        
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        cityLabel.text = receivedCity
        nameLabel.text = "HELLO \(receivedName.uppercaseString),"
        
        nameLabel.font = UIFont(name: "BrandonGrotesque-Medium", size: 13)
        cityLabel.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    
}


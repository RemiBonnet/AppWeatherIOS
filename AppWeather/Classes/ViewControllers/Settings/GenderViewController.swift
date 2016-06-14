//
//  GenderViewController.swift
//  AppWeather
//
//  Created by Bonnet Rémi on 06/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import Foundation
import UIKit
import BEMCheckBox

class GenderViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var manCheckBox: BEMCheckBox!
    @IBOutlet weak var womanCheckBox: BEMCheckBox!
    @IBOutlet weak var iceLabel: UILabel!
    @IBOutlet weak var chick: UILabel!
    @IBOutlet weak var dude: UILabel!

    
    var receivedName: String = ""
    var gender: String = ""
    
    
    
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
        
        nameTextLabel.text = "HELLO \(receivedName.uppercaseString)"
        iceLabel.font = UIFont(name: "BrandonGrotesque-Medium", size: 19)
        nameTextLabel.font = UIFont(name: "BrandonGrotesque-Black", size: 30)
        chick.font = UIFont(name: "BrandonGrotesque-Black", size: 14)
        dude.font = UIFont(name: "BrandonGrotesque-Black", size: 14)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // MARK: Action
    @IBAction func genderAction(sender: UIButton) {
        
        if self.manCheckBox.on == true && self.womanCheckBox.on == false {
            gender = "man"
        } else if self.womanCheckBox.on == true && self.manCheckBox.on == false {
            gender = "woman"
        } else if self.womanCheckBox.on == true && self.manCheckBox.on == true {
            gender = "erreur"
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "genderIdentifier") {
            
            let cityViewController: CityViewController = segue.destinationViewController as! CityViewController
            
            cityViewController.receivedGender = gender
            cityViewController.receivedName = receivedName
        }
    }
}
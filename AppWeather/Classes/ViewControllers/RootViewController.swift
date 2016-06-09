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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let receivedName = user.objectForKey("name_default")  as! String
        let receivedGender = user.objectForKey("gender_default")
        let receivedCity = user.objectForKey("city_default")
        
        
        
        print("RootView -> Name:\(receivedName)")
        print("RootView -> Gender:\(receivedGender)")
        print("RootView -> City:\(receivedCity)")
        
        nameLabel.text = receivedName
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    
}


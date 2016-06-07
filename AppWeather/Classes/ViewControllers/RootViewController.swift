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
    @IBOutlet weak var nameCity: UILabel!
    
    var receivedCity: String = ""
    var receivedName: String = ""
    var receivedGender: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nameCity.text = receivedCity
        print("RootView -> Name city:\(receivedCity)")
        print("RootView -> Gender:\(receivedGender)")
        print("RootView -> Name:\(receivedName)")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
}


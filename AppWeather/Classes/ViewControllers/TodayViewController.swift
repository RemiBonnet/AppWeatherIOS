//
//  RootViewController.swift
//  AppWeather
//
//  Created by Bonnet Rémi on 01/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController, WeatherServiceDelegate {
    
    // MARK: Properties
    let weatherService = WeatherService()
    
    var user = NSUserDefaults()
    var receivedName: String = ""
    var receivedCity: String = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconWeather: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.weatherService.delegate = self
        
        // Data user
        let receivedName = user.objectForKey("name_default")  as! String
        let receivedCity = user.objectForKey("city_default") as! String
        
        // Get weather
        self.weatherService.getWeather(receivedCity)
        
        // City
        cityLabel.text = receivedCity.capitalizedString
        
        // Name
        nameLabel.text = "HELLO \(receivedName.uppercaseString),"
        nameLabel.font = UIFont(name: "BrandonGrotesque-Bold", size: 25)
        
        // Date
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .MediumStyle
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
    
        dayLabel.text = "\(dateFormatter.stringFromDate(NSDate()).capitalizedString)"
        dayLabel.font = UIFont(name: "BrandonGrotesque-Bold", size: 22)
        
    }
    
    func setWeather(weather: Weather) {
        // Description
        descriptionLabel.text = weather.description.capitalizedString
        descriptionLabel.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)
        // Temperature
        tempLabel.text = "\(Int(weather.temp - 273.5))°"
        tempLabel.font = UIFont(name: "BrandonGrotesque-Bold", size: 25)
        // Icon
        iconWeather.image = UIImage(named: weather.icon)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    
}


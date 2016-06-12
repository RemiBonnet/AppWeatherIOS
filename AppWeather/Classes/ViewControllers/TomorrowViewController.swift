//
//  TomorrowViewController.swift
//  AppWeather
//
//  Created by Bonnet Rémi on 12/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import UIKit

class TomorrowViewController: UIViewController, WeatherServiceDelegate {
    
    // MARK: Properties
    let weatherService = WeatherService()
    
    var user = NSUserDefaults()
    var receivedName: String = ""
    var receivedCity: String = ""
    
    @IBOutlet weak var cityTomorrowLabel: UILabel!
    @IBOutlet weak var nameTomorrowLabel: UILabel!
    @IBOutlet weak var descriptionTomorrowLabel: UILabel!
    @IBOutlet weak var dayTomorrowLabel: UILabel!
    @IBOutlet weak var tempTomorrowLabel: UILabel!
    @IBOutlet weak var iconWeather: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.weatherService.delegate = self
        
        // Data user
        let receivedName = user.objectForKey("name_default")  as! String
        let receivedCity = user.objectForKey("city_default") as! String
        
        // Get tomorrow weather
//        self.weatherService.getTomorrowWeather(receivedCity)
        
        // City
        cityTomorrowLabel.text = receivedCity.capitalizedString

        // Name
        nameTomorrowLabel.text = "HELLO \(receivedName.uppercaseString),"
        nameTomorrowLabel.font = UIFont(name: "BrandonGrotesque-Bold", size: 25)
        
        // Date
        var oneDayfromNow: NSDate {
            return NSCalendar
                   .currentCalendar()
                   .dateByAddingUnit(.Day,value: 1,toDate: NSDate(), options: [])!
        }
        
        print(oneDayfromNow)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .MediumStyle
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        
        dayTomorrowLabel.text = "\(dateFormatter.stringFromDate(oneDayfromNow).capitalizedString)"
        dayTomorrowLabel.font = UIFont(name: "BrandonGrotesque-Bold", size: 22)
        
        
    }
    
    func setWeather(weather: Weather) {
        // Description
        descriptionTomorrowLabel.text = weather.description.capitalizedString
        descriptionTomorrowLabel.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)
        // Temperature
        tempTomorrowLabel.text = "\(Int(weather.temp - 273.5))°"
        tempTomorrowLabel.font = UIFont(name: "BrandonGrotesque-Bold", size: 25)
        // Icon
        iconWeather.image = UIImage(named: weather.icon)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

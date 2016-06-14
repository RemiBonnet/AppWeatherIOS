//
//  RootViewController.swift
//  AppWeather
//
//  Created by Bonnet Rémi on 01/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController, StyleServiceDelegate, WeatherServiceDelegate {
    
    // MARK: Properties
    let weatherService = WeatherService()
    let styleService = StyleService()
    
    var user = NSUserDefaults()
    var receivedName: String = ""
    var receivedCity: String = ""
    var receivedGender: String = ""

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconWeather: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    
<<<<<<< HEAD
    @IBOutlet weak var clothes: UIImageView!
    @IBOutlet weak var background: UIImageView!
=======
    @IBOutlet weak var topStyle: UIImageView!
    @IBOutlet weak var accessoryStyle: UIImageView!
    @IBOutlet weak var botStyle: UIImageView!
>>>>>>> 1ab0d83289e151f477727f21400b8e36f76adb51
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.weatherService.delegate = self
        self.styleService.delegate = self
        
        // Data user
        let receivedName = user.objectForKey("name_default")  as! String
        let receivedCity = user.objectForKey("city_default") as! String
        let receivedGender = user.objectForKey("gender_default") as! String
        
        
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
        // Temperature
        tempLabel.text = "\(Int(weather.temp - 273.5))°"
        tempLabel.font = UIFont(name: "BrandonGrotesque-Bold", size: 25)
        // Icon
        iconWeather.image = UIImage(named: weather.icon)
        
        // Get style
<<<<<<< HEAD
        let weatherTemp = (weather.temp - 273.5)
        self.styleService.getStyle(weatherTemp, icon: weather.icon, gender: receivedGender)
    }
    
    func setStyle(style: Style) {
        // Background
        background.image = UIImage(named: style.background)
        // Clothes
        clothes.image = UIImage(named: style.clothes)
        // Description
        descriptionLabel.text = style.description.capitalizedString
        descriptionLabel.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)
=======
        self.styleService.getStyle(weather.temp, icon: weather.icon)
    }
    
    func setStyle(style: Style) {
        // Top Style
        topStyle.image = UIImage(named: style.mainClothe)
        // Accessory
        accessoryStyle.image = UIImage(named: style.firstAccessory)
        // Bot Style
        botStyle.image = UIImage(named: style.secondAccessory)
>>>>>>> 1ab0d83289e151f477727f21400b8e36f76adb51
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    
}


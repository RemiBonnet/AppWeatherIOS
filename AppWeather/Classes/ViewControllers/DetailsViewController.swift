//
//  DetailsViewController.swift
//  AppWeather
//
//  Created by Bonnet Rémi on 10/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, WeatherServiceDelegate {
    
    // MARK: Properties
    let weatherService = WeatherService()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var sunrise: Double = 0.0
    var namesData = ["SUNRISE","SUNSET","HUMIDITY","WIND SPEED"]
    var data = ["SUNRISE","SUNSET","HUMIDITY","WIND SPEED"]
    
    var user = NSUserDefaults()
    var receivedCity: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.weatherService.delegate = self
        
        let receivedCity = user.objectForKey("city_default") as! String
        
        self.weatherService.getWeather(receivedCity)
        
        // Date
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .MediumStyle
        dateFormatter.dateFormat = "EEEE d"
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        
        dateLabel.text = "\(dateFormatter.stringFromDate(NSDate()).uppercaseString)"
        dateLabel.font = UIFont(name: "BrandonGrotesque-Bold", size: 16)
        
    }
    
    func setWeather(weather: Weather) {
        // Temp
        tempLabel.text = "\(Int(weather.temp - 273.5))°"
        tempLabel.font = UIFont(name: "BrandonGrotesque-Light", size: 75)
        
        // Description
        descriptionLabel.text = weather.description.capitalizedString
        descriptionLabel.font = UIFont(name: "BrandonGrotesque-Medium", size: 22)
        
        // Formatter Date for Sunrise and Sunset
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm"
        
        // Sunrise
        let sunrise = weather.sunrise
        let dateSunrise = NSDate(timeIntervalSince1970: sunrise)
        let utcTimeSunrise = formatter.stringFromDate(dateSunrise)
        data[0] = "\(String(utcTimeSunrise))"
        
        // Sunset
        let sunset = weather.sunset
        let dateSunset = NSDate(timeIntervalSince1970: sunset)
        let utcTimeSunset = formatter.stringFromDate(dateSunset)
        data[1] = "\(String(utcTimeSunset))"
        
        // Humidity
        let humidity = String(weather.humidity)
        data[2] = "\(humidity)%"
        
        // Wind Speed
        let wind = String(weather.windSpeed)
        data[3] = "\(wind) m/s"
        
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DetailsCell
        
        cell.nameData.text = namesData[indexPath.row]
        cell.data.text = data[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
        
        
    }
    

    
}


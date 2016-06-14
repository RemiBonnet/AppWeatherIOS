//
//  WeatherService.swift
//  AppWeather
//
//  Created by Baptiste Lambert on 04/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol WeatherServiceDelegate {
    
    func setWeather(weather: Weather)
    
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    // MARK: - Get weather methods
    
    // Return current weather data for a specific city
    func getWeather(city: String) {
        
        let url = NSURL(string: UrlBuilder.getCurrentCityWeather(city))
        
        buildCurrentWeatherTask(url!)
        
    }
    
    // Return next day's weather data for a specific city
    func getTomorrowWeather(city: String) {
        
        let url = NSURL(string: UrlBuilder.getForecastCityWeather(city))
        
        buildTomorrowWeatherTask(url!)
        
    }
    
    // Return current weather data for coords
    func getWeatherCoord(lat: Double, lon: Double) {
        
        let url = NSURL(string: UrlBuilder.getCurrentCoordWeather(lat, lon: lon))
        
        buildCurrentWeatherTask(url!)
        
    }
    
    // Return next day's weather data for coords
    func getTomorrowWeatherCoord(lat: Double, lon: Double) {
        
        let url = NSURL(string: UrlBuilder.getForecastCoordWeather(lat, lon: lon))
        
        buildTomorrowWeatherTask(url!)
    }
    
    // MARK: - Private methods
    
    private func buildCurrentWeatherTask(url: NSURL) {
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            let json = JSON(data: data!)
            
            let name = json["name"].string
            let description = json["weather"][0]["description"].string
            let temp = json["main"]["temp"].double
            let icon = json["weather"][0]["icon"].string
            let windSpeed = json["wind"]["speed"].double
            let humidity = json["main"]["humidity"].double
            let sunrise = json["sys"]["sunrise"].double
            let sunset = json["sys"]["sunset"].double
            let pressure = json["main"]["pressure"].double
            
            let weather = Weather(
                cityName: name!,
                description: description!,
                temp: temp!,
                icon: icon!,
                windSpeed: windSpeed!,
                humidity: humidity!,
                sunrise: sunrise!,
                sunset: sunset!,
                pressure: pressure!
            )
            
            if self.delegate != nil {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.delegate?.setWeather(weather)
                    
                })
            }
            
        }
        
        task.resume()
        
    }
    
    private func buildTomorrowWeatherTask(url: NSURL) {
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            let json = JSON(data: data!)
            
            let name = json["city"]["name"].string
            let description = json["list"][7]["weather"][0]["description"].string
            let temp = json["list"][7]["main"]["temp"].double
            let icon = json["list"][7]["weather"][0]["icon"].string
            
            let weather = Weather(cityName: name!, description: description!, temp: temp!, icon: icon!, windSpeed: 0, humidity: 0, sunrise: 0, sunset: 0, pressure: 0)

            if self.delegate != nil {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.delegate?.setWeather(weather)
                    
                })
            }
            
        }
        
        task.resume()
    }
    
    
}
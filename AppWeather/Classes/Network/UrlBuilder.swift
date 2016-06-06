//
//  UrlBuilder.swift
//  AppWeather
//
//  Created by Baptiste Lambert on 04/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import Foundation

class UrlBuilder {
    
    static let apiKey = "4c2cc24b24049e5d76752e73d0791a72"
    
    // Return current weather URL for a specific city
    static func getCurrentCityWeather(city: String) -> String {
        
        let cityEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        
        let url = "http://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped)&appid=\(apiKey)"
        
        return url
        
    }
    
    // Return forecast weather URL for a specific city
    static func getForecastCityWeather(city: String) -> String {
        
        let cityEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        
        let url = "http://api.openweathermap.org/data/2.5/forecast?q=\(cityEscaped)&appid=\(apiKey)"
        
        return url
        
    }
    
}
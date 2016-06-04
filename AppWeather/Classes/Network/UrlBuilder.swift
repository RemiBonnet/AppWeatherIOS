//
//  UrlBuilder.swift
//  AppWeather
//
//  Created by Baptiste Lambert on 04/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import Foundation

class UrlBuilder {
    
    static func getCurrentCityWeather(city: String) -> String {
        
        let apiKey = "4c2cc24b24049e5d76752e73d0791a72"
        let cityEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        
        let url = "http://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped)&appid=\(apiKey)"
        
        return url
        
    }
    
}
//
//  Weather.swift
//  AppWeather
//
//  Created by Baptiste Lambert on 04/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import Foundation

struct Weather {
    let cityName: String
    let description: String
    let temp: Double
    let icon: String
    let windSpeed: Double
    let humidity: Double
    let sunrise: Double
    let sunset: Double
    let pressure: Double
    
    init(cityName: String, description: String, temp: Double, icon: String, windSpeed: Double, humidity: Double, sunrise: Double, sunset: Double, pressure: Double) {
        self.cityName = cityName
        self.description = description
        self.temp = temp
        self.icon = icon
        self.windSpeed = windSpeed
        self.humidity = humidity
        self.sunrise = sunrise
        self.sunset = sunset
        self.pressure = pressure
    }
}
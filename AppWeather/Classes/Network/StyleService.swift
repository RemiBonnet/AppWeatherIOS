//
//  StyleService.swift
//  AppWeather
//
//  Created by Baptiste Lambert on 13/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import Foundation

protocol StyleServiceDelegate {
    
    func setStyle(style: Style)
    
}

class StyleService {
    
    var delegate: StyleServiceDelegate?
    
    let rainIcons = ["09d", "10d", "11d","09n", "10n", "11n"]
    
    func getStyle(temp: Double, icon: String, gender: String) {
        
        let isRainy = checkRainStatus(icon)
        
        if isRainy == true {
            
            switch (temp) {
            case let temp where temp < 0:
                
                let style = Style(clothes: "pluie0", background: "snow_background", description: "Let it go, let it go")
                
                taskStyle(style)
                
            case let temp where temp >= 0 && temp < 10:
                
                let style = Style(clothes: "pluie10", background: "rain_background", description: "Good time to be sick")
                
                taskStyle(style)
                
            case let temp where temp >= 10 && temp < 20:
                
                let style = Style(clothes: "pluie20", background: "rain_background", description: "Hang in there")
                
                taskStyle(style)
                
            case let temp where temp >= 20 && temp < 30:
                
                let style = Style(clothes: "pluie30", background: "rain_background", description: "No BBQ today")
                
                taskStyle(style)
                
            case let temp where temp >= 30:
                
                let style = Style(clothes: "pluie30+", background: "rain_background", description: "It's hot and wet outside like your...")
            
                taskStyle(style)
                
            default:
                print("error temp")
                
            }
            
        } else {
            
            switch (temp) {
            case let temp where temp < 0:
                
                let style = Style(clothes: "paspluie0", background: "sun_background", description: "Is it cold enough for you ?")
                
                taskStyle(style)
                
            case let temp where temp >= 0 && temp < 10:
                
                let style = Style(clothes: "paspluie10", background: "sun_background", description: "It could be worse")
                
                taskStyle(style)
                
            case let temp where temp >= 10 && temp < 20:
                
                let style = Style(clothes: "paspluie20", background: "sun_background", description: "“Take a sweater.“ Mom")
                
                taskStyle(style)
                
            case let temp where temp >= 20 && temp < 30:
                
                if gender == "man" {
                    
                    let style = Style(clothes: "paspluie30", background: "hot_background", description: "Now we're talking")
                    
                    taskStyle(style)
                    
                } else {
                    
                    let style = Style(clothes: "fpaspluie30", background: "hot_background", description: "Now we're talking")
                    
                    taskStyle(style)
                    
                }
                
                
            case let temp where temp >= 30:
                
                if gender == "man" {
                
                    let style = Style(clothes: "paspluie30+", background: "hot_background", description: "Save your clothes for a rainy day")
                    
                    taskStyle(style)
                
                } else {
                    
                    let style = Style(clothes: "fpaspluie30+", background: "hot_background", description: "Save your clothes for a rainy day")
                    
                    taskStyle(style)
                    
                }
                
            default:
                print("error temp")
                
            }
            
        }
        
    }
    
    private func taskStyle(style: Style) {
    
        if self.delegate != nil {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.delegate?.setStyle(style)
                
            })
        }
    
    }
    
    private func checkRainStatus(icon: String) -> Bool {
        
        if rainIcons.contains(icon) {
            return true
        } else {
            return false
        }
        
    }
    
}
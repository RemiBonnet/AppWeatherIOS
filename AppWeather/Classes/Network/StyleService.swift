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
    
    func getStyle(temp: Double, icon: String) {
        
        let isRainy = checkRainStatus(icon)
        
        if isRainy == true {
            
            switch (temp) {
            case let temp where temp < 0:
                
                let style = Style(mainClothe: "doudoune", firstAccessory: "bonnet", secondAccessory: "echarpe")
                
                taskStyle(style)
                
            case let temp where temp >= 0 && temp < 10:
                
                let style = Style(mainClothe: "doudoune", firstAccessory: "parapluie", secondAccessory: "echarpe")
                
                taskStyle(style)
                
            case let temp where temp >= 10 && temp < 20:
                
                let style = Style(mainClothe: "cire", firstAccessory: "botte", secondAccessory: "echarpe")
                
                taskStyle(style)
                
            case let temp where temp >= 20 && temp < 30:
                
                let style = Style(mainClothe: "pullover", firstAccessory: "parapluie", secondAccessory: "basket")
                
                taskStyle(style)
                
            case let temp where temp >= 30:
                
                let style = Style(mainClothe: "slip", firstAccessory: "parapluie", secondAccessory: "lunettes")
            
                taskStyle(style)
                
            default:
                print("error temp")
                
            }
            
        } else {
            
            switch (temp) {
            case let temp where temp < 0:
                
                let style = Style(mainClothe: "doudoune", firstAccessory: "bonnet", secondAccessory: "gant")
                
                taskStyle(style)
                
            case let temp where temp >= 0 && temp < 10:
                
                let style = Style(mainClothe: "pullover", firstAccessory: "bonnet", secondAccessory: "echarpe")
                
                taskStyle(style)
                
            case let temp where temp >= 10 && temp < 20:
                
                let style = Style(mainClothe: "chemise", firstAccessory: "casquette", secondAccessory: "basket")
                
                taskStyle(style)
                
            case let temp where temp >= 20 && temp < 30:
                
                let style = Style(mainClothe: "debardeur", firstAccessory: "lunettes", secondAccessory: "tong")
                
                taskStyle(style)
                
            case let temp where temp >= 30:
                
                let style = Style(mainClothe: "slip", firstAccessory: "lunettes", secondAccessory: "tong")
            
                taskStyle(style)
                
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
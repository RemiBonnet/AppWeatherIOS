//
//  Style.swift
//  AppWeather
//
//  Created by Baptiste Lambert on 13/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import Foundation

struct Style {
    let mainClothe: String
    let firstAccessory: String
    let secondAccessory: String
    let background: String
    let description: String
    
    init(mainClothe: String, firstAccessory: String, secondAccessory: String, background: String, description: String) {
        self.mainClothe = mainClothe
        self.firstAccessory = firstAccessory
        self.secondAccessory = secondAccessory
        self.background = background
        self.description = description
    }
}
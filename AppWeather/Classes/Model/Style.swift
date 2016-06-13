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
    
    init(mainClothe: String, firstAccessory: String, secondAccessory: String) {
        self.mainClothe = mainClothe
        self.firstAccessory = firstAccessory
        self.secondAccessory = secondAccessory
    }
}
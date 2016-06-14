//
//  Style.swift
//  AppWeather
//
//  Created by Baptiste Lambert on 13/06/2016.
//  Copyright © 2016 Dream Team. All rights reserved.
//

import Foundation

struct Style {
    let clothes: String
    let background: String
    let description: String
    
    init(clothes: String, background: String, description: String) {
        self.clothes = clothes
        self.background = background
        self.description = description
    }
}
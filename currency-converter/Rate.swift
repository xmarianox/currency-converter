//
//  Rate.swift
//  currency-converter
//
//  Created by Mariano Molina on 13/9/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import Foundation


/**
 Currency Object Model
*/
struct Rate {
    let rateName: String
    let rateValue: Double
    
    init(name: String, value: Double) {
        self.rateName = name
        self.rateValue = value
    }
}
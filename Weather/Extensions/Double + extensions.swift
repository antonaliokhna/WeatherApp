//
//  Double + extensions.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/18/22.
//

import Foundation

extension Double {
    var toRoundedNonfractionalStringValue: String {
        return String(format: "%.f", (self.rounded()))
    }
}

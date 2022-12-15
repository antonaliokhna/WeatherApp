//
//  String + extension.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/15/22.
//

import Foundation

extension Double {
    var roundedSingleValue: String {
        return String(format: "%.f", (self.rounded()))
    }
}

//
//  Date + extensions.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/19/22.
//

import Foundation

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        
        return dateFormatter.string(from: self).capitalized
    }
}

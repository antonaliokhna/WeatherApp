//
//  String + extensions.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/18/22.
//

import Foundation

extension String {
    func stringToDate(format: String = "yyyy-MM-dd H:mm") -> Date? {
        let isoDate = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: isoDate)
    }
}

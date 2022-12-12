//
//  WeatherListModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation

struct WeatherListModel {
    private var addCities = ["Warsaw","Bucharest","Martuni","Shah Alam","Karmie","Budapest","Munich","Netivot","Santa Cruz de la Sierra","Porto Alegre","Kfar Yona","Palermo","Bremen","Jermuk","Beit Shemesh","Florence","Utrecht","Buenos Aires","Guayaquil","Rosario","Soledad","Subang Jaya","Valencia","Pasir Gudang","Akhtala"]
    lazy var filteredCities: [String] = addCities

    mutating func filterCitiesBy(text: String) {
        guard !text.isEmpty else {
            clearFilteredCities()

            return
        }
        filteredCities = addCities.filter{ $0.hasPrefix(text) }
    }

    mutating func clearFilteredCities() {
        filteredCities = addCities
    }
}

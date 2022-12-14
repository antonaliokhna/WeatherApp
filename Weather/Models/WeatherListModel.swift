//
//  WeatherListModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation

struct WeatherListModel {
    private(set) var favoriteCities = ["Warsaw"]

    lazy var filteredCities: [String] = favoriteCities

    mutating func filterCitiesBy(text: String) {
        guard !text.isEmpty else {
            clearFilteredCities()

            return
        }
        filteredCities = favoriteCities.filter{ $0.hasPrefix(text) }
    }

    mutating func clearFilteredCities() {
        filteredCities = favoriteCities
    }

    mutating func addFavoriteCity(name: String) {
        favoriteCities.append(name)
    }
}

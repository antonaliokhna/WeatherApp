//
//  WeatherListModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation

struct WeatherListModel {
    private(set) var favoriteCities = ["Warsaw", "Bucharest", "Martuni", "Shah Alam", "Budapest"]

    mutating func addFavoriteCity(name: String) {
        favoriteCities.append(name)
    }
}

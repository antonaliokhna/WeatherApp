//
//  SearchCityWeatherModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/14/22.
//

import Foundation

struct SearchCityWeatherModel: Codable {
    let id: Int
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
}

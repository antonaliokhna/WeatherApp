//
//  WeatherCityRowViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/12/22.
//

import Foundation

final class WeatherCityRowViewModel: ObservableObject {
    var cityName: String

    init(cityName: String) {
        self.cityName = cityName
    }
}

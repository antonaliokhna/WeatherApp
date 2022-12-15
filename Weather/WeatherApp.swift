//
//  WeatherApp.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            //WeatherListView()
            DetailWeatherView(weatherViewModel: WeatherViewModel(cityName: "Minsk"))
        }
    }
}

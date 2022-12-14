//
//  WeatherListViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/12/22.
//

import Foundation

class WeatherListViewModel: ObservableObject {
    private let dataFetcher = DataFecherService()
    private var weatherListModel = WeatherListModel()
    @Published var filterCityText: String = "" {
        didSet {
            weatherListModel.filterCitiesBy(text: filterCityText)
        }
    }

    var weatherCities: [String] {
        weatherListModel.filteredCities
    }

    init(weatherCityRowViewModels: WeatherListModel = WeatherListModel()) {
        dataFetcher.fetchWeatherModelData(
            cityName: "Minsk",
            coundDaysforecast: 7
        ) { result in
            switch result {
            case .success(_):
                print("Model is decoded.")
            case .failure(let error):
                print(error.errorDescription ?? "some error")
            }
        }
    }
}

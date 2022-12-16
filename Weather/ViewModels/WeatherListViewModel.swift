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
    private var searchCitiesModels: [SearchCityWeatherModel] = []

    var currentSearchCity: String = ""

    var weatherViewModels: [WeatherViewModel] {
        return weatherFavoriteCities.map { WeatherViewModel(cityName: $0) }
    }

    @Published var searchCitiNames: [String] = []

    var searchCitiesNames: [String] {
       // return weatherListModel.favoriteCities
        return searchCitiesModels.map { $0.name }
    }

    //@Published var weatherViewModels: [WeatherViewModel] = []
    var filterCityText: String = "" {
        willSet {
            //weatherListModel.filterCitiesBy(text: filterCityText)
            if filterCityText.count >= 3 {
                searchCitiesBy(cityNameText: filterCityText)
            }
        }
    }

    var weatherFavoriteCities: [String] {
        return weatherListModel.favoriteCities
    }

    func searchCitiesBy(cityNameText: String) {
        dataFetcher.searchCityWeather(cityName: cityNameText) { result in
            switch result {
            case .success(let searchCities):
                self.searchCitiesModels = searchCities
                print( self.searchCitiesModels.count)
                self.searchCitiNames = searchCities.map { $0.name }
                self.searchCitiesModels.forEach { city in
                    print(city.name)
                }
            case .failure(let error):
                print(error.errorDescription ?? "some error")
            }
        }
    }

    func addFavoriteCity(name: String) {
        weatherListModel.addFavoriteCity(name: name)
    }
}

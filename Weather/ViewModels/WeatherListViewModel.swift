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

    @Published var favoriteWeatherViewModels: [WeatherViewModel] = []
    @Published var searchCitiNames: [String] = []
    var filterCityText: String = "" {
        willSet {
            if filterCityText.count >= 3 {
                searchCitiesBy(cityNameText: filterCityText)
            }
        }
    }

    var selectedCityName: String = ""
    var selectedCityWeatherViewModel: WeatherViewModel?

    var searchCitiesNames: [String] {
        return searchCitiesModels.map { $0.name }
    }

    var weatherFavoriteCities: [String] {
        return weatherListModel.favoriteCities
    }

    init() {
        self.favoriteWeatherViewModels = weatherFavoriteCities.map {
            WeatherViewModel(cityName: $0)
        }
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

    func addFavoriteCity() {
        guard let viewModel = selectedCityWeatherViewModel else { return }
        favoriteWeatherViewModels.append(viewModel)
        weatherListModel.addFavoriteCity(name: viewModel.cityName)
    }

    func createNewWeahetViewModelBySelectedCityName() -> WeatherViewModel {
        let viewModel = WeatherViewModel(cityName: selectedCityName)
        selectedCityWeatherViewModel = viewModel
        return viewModel
    }
}

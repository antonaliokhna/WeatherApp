//
//  WeatherListViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/12/22.
//

import Foundation

class WeatherListViewModel: ObservableObject {
    private let dataFetcher: DataFecherService

    private var weatherListModel: WeatherListModel
    private var searchCitiesModel: [SearchCityWeatherModel] = []
    private var selectedCityWeatherViewModel: WeatherViewModel?

    private(set) var favoriteWeatherViewModels: [WeatherViewModel] = []

    private var weatherFavoriteCities: [String] {
        return weatherListModel.favoriteCities
    }

    @Published var searchCityText: String = "" {
        didSet {
            guard searchCityText.count >= 3 else { return }
            searchCitiesBy(cityNameText: searchCityText)
        }
    }

    var selectedCityName: String = "" {
        didSet {
            guard !selectedCityName.isEmpty else { return }
            if let viewModel = favoriteWeatherViewModels.first(
                where: { viewModel in
                    viewModel.cityName == selectedCityName
                }
            ) {
                selectedCityWeatherViewModel = viewModel
            }
        }
    }

    var searchCitiesName: [String] {
        return searchCitiesModel.map { $0.name }
    }

    init(dataFetcher: DataFecherService = DataFecherService(),
         weatherListModel: WeatherListModel = WeatherListModel()
    ) {
        self.dataFetcher = dataFetcher
        self.weatherListModel = weatherListModel

        self.favoriteWeatherViewModels = weatherFavoriteCities.map {
            WeatherViewModel(cityName: $0)
        }
    }

    func searchCitiesBy(cityNameText: String) {
        self.dataFetcher.searchCityWeather(cityName: cityNameText) { result in
            switch result {
            case .success(let searchCities):
                self.searchCitiesModel = searchCities
            case .failure(let error):
                //TODO: Error logic
                print(error.errorDescription ?? "some error")
            }
        }
    }

    func addFavoriteCity() {
        guard let viewModel = selectedCityWeatherViewModel else { return }
        weatherListModel.addFavoriteCity(name: viewModel.cityName)
        favoriteWeatherViewModels.append(viewModel)
        selectedCityWeatherViewModel = nil
    }

    func createOrLoadWeahetViewModelBySelectedCity() -> WeatherViewModel {
        guard let selectedViewModel = selectedCityWeatherViewModel,
              selectedViewModel.cityName == selectedCityName else {
            let viewModel = WeatherViewModel(cityName: selectedCityName)
            selectedCityWeatherViewModel = viewModel

            return viewModel
        }

        return selectedViewModel
    }
}

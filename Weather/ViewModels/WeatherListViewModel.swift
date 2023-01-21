//
//  WeatherListViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/12/22.
//

import Foundation

class WeatherListViewModel: ObservableObject {
    private let networkDataFetcher: NetworkDataService
    private let localdataFetcher: LocalDataService

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

    init(dataFetcher: NetworkDataService = NetworkDataService(),
         localdataFetcher: LocalDataService = LocalDataService(),
         weatherListModel: WeatherListModel = WeatherListModel()
    ) {
        self.networkDataFetcher = dataFetcher
        self.weatherListModel = weatherListModel
        self.localdataFetcher = localdataFetcher

        localdataFetcher.fetchCityNames(by: "Cities") { result in
            switch result {
            case .success(let cities):
                print(cities)
                self.weatherListModel = WeatherListModel(favoriteCities: cities)
            case .failure(let error):
                print(error)
            }
        }

        self.favoriteWeatherViewModels = weatherFavoriteCities.map {
            WeatherViewModel(cityName: $0)
        }
    }

    func searchCitiesBy(cityNameText: String) {
        self.networkDataFetcher.searchCityWeather(cityName: cityNameText) { result in
            switch result {
            case .success(let searchCities):
                self.searchCitiesModel = searchCities
            case .failure(let error):
                //TODO: Error logic
                print(error)
            }
        }
    }

    func addFavoriteCity() {
        guard let viewModel = selectedCityWeatherViewModel else { return }
        weatherListModel.addFavoriteCity(name: viewModel.cityName)
        favoriteWeatherViewModels.append(viewModel)
        selectedCityWeatherViewModel = nil
        saveCities()
    }

    func removeFavoriteCity(at offset: IndexSet) {
        //TODO: - Bad logic
        offset.forEach { index in
            let index = favoriteWeatherViewModels.index(favoriteWeatherViewModels.startIndex, offsetBy: index)
            removeFavoriteCity(viewModel: favoriteWeatherViewModels[index])
        }
    }

    func removeFavoriteCity(viewModel: WeatherViewModel) {
        let cityName = viewModel.cityName
        favoriteWeatherViewModels.removeAll { $0.cityName == cityName }
        weatherListModel.removeFavoriteCity(name: cityName)
        saveCities()
    }

    private func saveCities() {
        localdataFetcher.pushCities(
            whereTo: "Cities",
            names: weatherListModel.favoriteCities
        ) { result in
            print(result)
        }
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

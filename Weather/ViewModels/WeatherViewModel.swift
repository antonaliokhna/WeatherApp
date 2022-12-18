//
//  WeatherCityRowViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/12/22.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    private let dataFetcher = DataFecherService()

    private var weatherModel = CurrentValueSubject<WeatherModel?, NetworkError>(nil)
    private var cancellables = Set<AnyCancellable>()

    @Published var status: NetworkStatuses = .loading
    @Published var cityName: String = "--"

    @Published var detailHeaderVideModel: WeatherHeaderViewModel?
    @Published var dailyForecastViewModels: [DailyForecastWeatherViewModel] = []
    @Published var hourlyForecastWeatherListViewModel: HourlyForecastWeatherListViewModel?
    @Published var descriptionDetailViewModel: DescriptionItemCollectionViewModel?

    init(cityName: String) {
        self.cityName = cityName
        fetchWeatherModel(cityName: cityName)
    }

    func selectNewCity(viewModel: WeatherViewModel) {
        self.cityName = viewModel.cityName
        self.status = viewModel.status
        self.weatherModel = viewModel.weatherModel
        self.detailHeaderVideModel =  viewModel.detailHeaderVideModel
        self.dailyForecastViewModels = viewModel.dailyForecastViewModels
        self.hourlyForecastWeatherListViewModel =
        viewModel.hourlyForecastWeatherListViewModel
        self.descriptionDetailViewModel = viewModel.descriptionDetailViewModel
    }
    
    func retryFetchWeatherModel() {
        fetchWeatherModel(cityName: cityName)
        status = .loading
    }
}

//MARK: - Private network logic functions
extension WeatherViewModel {
    private func fetchWeatherModel(cityName: String) {
        dataFetcher.fetchWeatherModelData(
            cityName: cityName,
            countDayforecast: 7
        ) { result in
            switch result {
            case .success(let model):
                self.weatherModel.send(model)

                self.cityName = model.location.name
                self.status = .sucsess

                self.dailyForecastViewModels = model.forecast.forecastday.map {
                    DailyForecastWeatherViewModel(weathderForecustDay: $0)
                }

                self.hourlyForecastWeatherListViewModel =
                HourlyForecastWeatherListViewModel(
                    weatherForecastDay: model.forecast.forecastday,
                    currentDate: Date(
                        timeIntervalSince1970: model.location.localtimeEpoch
                    )
                )

                self.detailHeaderVideModel = WeatherHeaderViewModel(
                    weatherModel: model
                )

                self.descriptionDetailViewModel =
                DescriptionItemCollectionViewModel(
                    currentWeatherModel: model.current
                )

                self.status = .sucsess
            case .failure(let error):
                self.weatherModel.send(completion: .failure(error))
                self.status = .failed(status: error)
            }
        }
    }
}

//MARK: - Hashable
extension WeatherViewModel: Hashable {
    var identifier: String {
        return UUID().uuidString
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }

    static func == (lhs: WeatherViewModel, rhs: WeatherViewModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

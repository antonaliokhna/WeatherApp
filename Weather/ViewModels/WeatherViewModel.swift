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

    var detailHeaderVideModel: DetailWeatherHeaderViewModel {
        return DetailWeatherHeaderViewModel(weatherModel: weatherModel.value ?? )
    }

//    var currentWeather: [WeatherModel.Current] {
//        return weatherModel.value?.current ?? WeatherModel.Current(
//    }


//    var currentWeather: WeatherModel.Current {
//        return weatherModel.value!.current
//    }

    init(cityName: String) {
        self.cityName = cityName
        fetchWeatherModel(cityName: cityName)
        setupWeatherModelBindings()
    }

    func retryFetchWeatherModel() {
        fetchWeatherModel(cityName: self.cityName)
        status = .loading
    }
}

//MARK: - Private network logic functions
extension WeatherViewModel {
    private func fetchWeatherModel(cityName: String) {
        dataFetcher.fetchWeatherModelData(
            cityName: cityName,
            coundDaysforecast: 7
        ) { [weak self] result in
            switch result {
            case .success(let model):
                self?.weatherModel.send(model)
                self?.status = .sucsess
            case .failure(let error):
                self?.weatherModel.send(completion: .failure(error))
                self?.status = .failed(status: error)
            }
        }
    }

    private func setupWeatherModelBindings() {
        weatherModel
            .sink { completion in
                switch completion {
                case .failure(let error):
                    //self.appError = error
                    print(error)
                case .finished:
                    print("Finished")
                    break
                }
            } receiveValue: { [weak self] weatherModel in
                guard let self = self,
                      let weather = weatherModel else { return }
                self.cityName = weather.location.name
                print(weather.location.name)
                //                self.name = detail.name
                //                self.height = self.formatHW(value: detail.height)
                //                self.weight = self.formatHW(value: detail.weight)
                //                self.imageURL = detail.pokemonImage
                //                self.type = detail.pokemonType
            }
            .store(in: &cancellables)
    }
}

//MARK: - Hashable protocol
extension WeatherViewModel: Hashable {
    var identifier: String {
        return UUID().uuidString
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }

    static func == (lhs: WeatherViewModel, rhs: WeatherViewModel) -> Bool {
        return lhs.cityName == rhs.cityName
    }
}

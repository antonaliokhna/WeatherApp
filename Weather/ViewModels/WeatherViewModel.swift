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

    @Published var detailHeaderVideModel1: DetailWeatherHeaderViewModel?
    @Published var dailyForecastViewModels1: [DailyForecastWeatherViewModel] = []
    @Published var hourlyForecastViewModel : [HourlyForecastRowViewModel] = []

    var detailHeaderVideModel: DetailWeatherHeaderViewModel {
        //TODO: - REPLASE TO EMPTY INIT
        return DetailWeatherHeaderViewModel(weatherModel: weatherModel.value!)
    }

    var dailyForecastViewModels: [DailyForecastWeatherViewModel] {
        return weatherModel.value!.forecast.forecastday.map {
            DailyForecastWeatherViewModel(weathderForecustDay: $0)
        }
    }

//    var hourlyForecastRowViewModel: [HourlyForecastRowViewModel] {
//        return
//    }


//    var currentWeather: [WeatherModel.Current] {
//        return weatherModel.value?.current ?? WeatherModel.Current(
//    }


//    var currentWeather: WeatherModel.Current {
//        return weatherModel.value!.current
//    }

    init(cityName: String) {
        self.cityName = cityName
        fetchWeatherModel(cityName: cityName)
        //setupWeatherModelBindings()
    }

    func selectNewCity(cityName: String) {
        self.cityName = cityName
        fetchWeatherModel(cityName: cityName)
        //setupWeatherModelBindings()
        status = .loading
        print(cityName)
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
            coundDaysforecast: 7
        ) { result in
            switch result {
            case .success(let model):
                self.weatherModel.send(model)
                self.status = .sucsess
                self.cityName = model.location.name
                self.status = .sucsess

//                self.hourlyForecastViewModel  = model.forecast.forecastday.m {
//                    DailyForecastWeatherViewModel(weathderForecustDay: $0)
//                }

                self.dailyForecastViewModels1 = model.forecast.forecastday.map {
                    DailyForecastWeatherViewModel(weathderForecustDay: $0)
                }
                self.detailHeaderVideModel1 = DetailWeatherHeaderViewModel(
                    weatherModel: model
                )

                print("Sucsess result")
            case .failure(let error):
                self.weatherModel.send(completion: .failure(error))
                print("Erorr result")
                self.status = .failed(status: error)
            }
        }
    }

//    private func setupWeatherModelBindings() {
//        weatherModel
//            .sink { completion in
//                switch completion {
//                case .failure(let error):
//                    //self.appError = error
//                    print(error)
//                case .finished:
//                    print("Finished")
//                    break
//                }
//            } receiveValue: { [weak self] weatherModel in
//                guard let self = self,
//                      let weather = weatherModel else { return }
//
//                print("azaz")
//            }
//            .store(in: &cancellables)
//    }
}

//MARK: - Hashable protocol
//extension WeatherViewModel: Hashable {
//    var identifier: String {
//        return UUID().uuidString
//    }
//
//    public func hash(into hasher: inout Hasher) {
//        return hasher.combine(identifier)
//    }
//
//    static func == (lhs: WeatherViewModel, rhs: WeatherViewModel) -> Bool {
//        return lhs.cityName == rhs.cityName
//    }
//}

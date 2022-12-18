//
//  DataFetcherService.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation

class DataFecherService {
    typealias Parameters = [String: Any]

    private let apiKey = "API_KEY"

    var dataFetcher: DataFetcherType

    init(dataFetcher: DataFetcherType = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }

    func fetchWeatherModelData(
        cityName: String,
        countDayforecast: Int,
        completion: @escaping (Result<WeatherModel, NetworkError>) -> Void
    ) {
        let stringUrl = "https://api.weatherapi.com/v1/forecast.json?"
        let paremeters: Parameters = [
            "key": self.apiKey,
            "q": cityName,
            "days": countDayforecast,
        ]

        self.dataFetcher.fetchGenericJSONData(
            stringUrl: stringUrl,
            parameters: paremeters,
            response: completion
        )
    }

    func searchCityWeather(
        cityName: String,
        completion: @escaping (Result<[SearchCityWeatherModel], NetworkError>) -> Void
    ) {
        let stringUrl = "https://api.weatherapi.com/v1/search.json?"
        let paremeters: Parameters = [
            "key": self.apiKey,
            "q": cityName,
        ]

        self.dataFetcher.fetchGenericJSONData(
            stringUrl: stringUrl,
            parameters: paremeters,
            response: completion
        )
    }
}

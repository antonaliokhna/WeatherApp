//
//  NetworkDataService.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation

class NetworkDataService {

    private let apiKey = "bc6f84dcf4ef4bb7a1b230849221212"

    typealias Parameters = [String: Any]

    var dataFetcher: DataFetcherType

    init(
        dataFetcher: DataFetcherType = DataFetcher(
            service: AlamofireNetworkService()
        )
    ) {
        self.dataFetcher = dataFetcher
    }

    func fetchWeatherModelData(
        cityName: String,
        countDayforecast: Int = 7,
        completion: @escaping (Result<WeatherModel, CustomError>) -> Void
    ) {
        let stringUrl = "https://api.weatherapi.com/v1/forecast.json?"
        let paremeters: Parameters = [
            "key": self.apiKey,
            "q": cityName,
            "days": countDayforecast,
        ]

        self.dataFetcher.fetchGenericData(
            url: stringUrl,
            parameters: paremeters,
            response: completion
        )
    }

    func searchCityWeather(
        cityName: String,
        completion:
            @escaping (Result<[SearchCityWeatherModel], CustomError>) -> Void
    ) {
        let stringUrl = "https://api.weatherapi.com/v1/search.json?"
        let paremeters: Parameters = [
            "key": self.apiKey,
            "q": cityName,
        ]

        self.dataFetcher.fetchGenericData(
            url: stringUrl,
            parameters: paremeters,
            response: completion
        )
    }
}

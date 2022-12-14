//
//  DataFetcherService.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation
import Alamofire

class DataFecherService {

    private let apiKey = "API_KEY"

    var dataFetcher: DataFetcherType

    init(dataFetcher: DataFetcherType = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }

    func fetchWeatherModelData(
        cityName: String,
        coundDaysforecast: Int,
        completion: @escaping (Result<WeatherModel, NetworkError>) -> Void
    ) {
        let stringUrl = "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(cityName)&days=\(coundDaysforecast)"

        self.dataFetcher.fetchGenericJSONData(stringUrl: stringUrl, response: completion)
    }
}

//
//  DataFetcherService.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation
import Alamofire

class DataFecherService {

    private let apiKey = "API KEY"

    var dataFetcher: DataFetcher

    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }

    func fetchWeatherData() {
        let cityName = "Minsk"
        let countDays = 7
        let url = "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(cityName)&days=\(countDays)"

        let completion =  { (result: Result<WeatherModel, NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.errorDescription ?? "some error")
                
            case .success(let model):
                print(model)
            }
        }

        dataFetcher.fetchGenericJSONData(stringUrl: url, response: completion)
    }
}

//
//  DetailWeatherHeaderViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/15/22.
//

import Foundation

class DetailWeatherHeaderViewModel {
    private let weatherModel: WeatherModel

    var cityName: String {
        return weatherModel.location.name
    }

    var temperature: String {
        return weatherModel.current.tempC.description
    }

    var description: String {
        return weatherModel.current.condition.text
    }

    var maxMinTemperature: String {
        guard let forecaseFirstDay = weatherModel.forecast.forecastday.first else {
            return "Unknown"
        }
        let max = forecaseFirstDay.day.maxtempC
        let min = forecaseFirstDay.day.mintempC

        return "H:\(max)° L:\(min)° "
    }

    var temperatureAndDescription: String {
        return "\(temperature) | \(description)"
    }

    init(weatherModel: WeatherModel) {
        self.weatherModel = weatherModel
    }
}

//
//  DetailWeatherHeaderViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/15/22.
//

import Foundation

class DetailWeatherHeaderViewModel {
    private let weatherModel: WeatherModel

    private var temperature: Double {
        return weatherModel.current.tempC
    }

    var cityName: String {
        return weatherModel.location.name
    }

    var temperatureWithoutSign: String {
        return "\(abs(temperature).roundedSingleValue)°"
    }

    var isNegativeTemperature: Bool {
        return temperature < 0
    }

    var description: String {
        return weatherModel.current.condition.text
    }

    var maxMinTemperature: String {
        guard let forecaseFirstDay = weatherModel.forecast.forecastday.first else {
            return "Unknown"
        }
        let max = forecaseFirstDay.day.maxtempC.roundedSingleValue
        let min = forecaseFirstDay.day.mintempC.roundedSingleValue

        return "H: \(max)° L: \(min)°"
    }

    var temperatureAndDescription: String {
        return "\(temperature) | \(description)"
    }

    init(weatherModel: WeatherModel) {
        self.weatherModel = weatherModel
    }
}

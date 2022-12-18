//
//  DetailWeatherHeaderViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/15/22.
//

import Foundation

class DetailWeatherHeaderViewModel: ObservableObject {
    private let weatherModel: WeatherModel

    private var temperatureDouble: Double {
        return weatherModel.current.tempC
    }

    var currentTime: String {

        let localtime = weatherModel.location.localtime
        guard let date = localtime.stringToDate() else {
            return "--"
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"

        return dateFormatter.string(from: date)
    }

    var temperature: String {
        return temperatureDouble.toRoundedNonfractionalStringValue
    }

    var cityName: String {
        return weatherModel.location.name
    }

    var temperatureWithoutSign: String {
        return "\(abs(temperatureDouble).toRoundedNonfractionalStringValue)°"
    }

    var isNegativeTemperature: Bool {
        return temperatureDouble < 0
    }

    var description: String {
        return weatherModel.current.condition.text
    }

    var maxMinTemperature: String {
        guard let forecaseFirstDay = weatherModel.forecast.forecastday.first else {
            return "Unknown"
        }
        let max = forecaseFirstDay.day.maxtempC.toRoundedNonfractionalStringValue
        let min = forecaseFirstDay.day.mintempC.toRoundedNonfractionalStringValue

        return "H: \(max)° L: \(min)°"
    }

    var temperatureAndDescription: String {
        return "\(temperature) | \(description)"
    }

    init(weatherModel: WeatherModel) {
        self.weatherModel = weatherModel
    }
}

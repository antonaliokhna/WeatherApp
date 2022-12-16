//
//  HourlyForecastRowViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/15/22.
//

import Foundation

class HourlyForecastRowViewModel {
    private let hourlyForecastModel: WeatherModel.Forecast.Forecastday.Hour

    var timeHour: String {
        //return weatherModel.current.tempC
        let timeSpan = hourlyForecastModel.timeEpoch
        let date = Date(timeIntervalSince1970: timeSpan)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)

        return "dsad"
    }

    init(hourlyForecastModel: WeatherModel.Forecast.Forecastday.Hour) {
        self.hourlyForecastModel = hourlyForecastModel
    }
}

//
//  DailyForecaseWeatherRowViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/15/22.
//

import Foundation

class DailyForecastWeatherViewModel {
    private let weatherForecustDay: WeatherModel.Forecast.Forecastday

    var weekDate: String {
        let timeSpanDate = weatherForecustDay.dateEpoch
        let date = timeSpanDate.timeSpanToDate
        guard let stringDayOfWeek = date.dayOfWeek() else { return "--" }

        return stringDayOfWeek
    }

    var weatherImage: String {
        //TODO: - Add logic
        return "cloud"
    }

    var precipitationProbability: String {
        //TODO: - Fix bad logic
        let chanceOfRain = weatherForecustDay.day.dailyChanceOfRain
        let chanceOfSnow = weatherForecustDay.day.dailyChanceOfSnow

        return "\(chanceOfRain > chanceOfSnow ? chanceOfRain : chanceOfSnow )%"
    }

    var minDayTemperature: String {
        let min = weatherForecustDay.day.mintempC
            .toRoundedNonfractionalStringValue

        return "\(min)°"
    }

    var maxDayTemperature: String {
        let max = weatherForecustDay.day.maxtempC
            .toRoundedNonfractionalStringValue

        return "\(max)°"
    }

    init(weathderForecustDay: WeatherModel.Forecast.Forecastday) {
        self.weatherForecustDay = weathderForecustDay
    }
}


//MARK: - Hashable
extension DailyForecastWeatherViewModel: Hashable {
    var identifier: String {
        return UUID().uuidString
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
    static func == (
        lhs: DailyForecastWeatherViewModel,
        rhs: DailyForecastWeatherViewModel
    ) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

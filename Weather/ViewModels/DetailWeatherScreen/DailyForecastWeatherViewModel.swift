//
//  DailyForecaseWeatherRowViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/15/22.
//

import Foundation

class DailyForecastWeatherViewModel {
    private let weathderForecustDay: WeatherModel.Forecast.Forecastday

    var weekDat: String {
        //TODO: - Add logic
        return "Today"
    }

    var weatherImage: String {
        //TODO: - Add logic
        //return weathderForecustDay.day.condition.code.description
        return "cloud"
    }

    var precipitationProbability: String {
        //TODO: - Fix bad logic
        let chanceOfRain = weathderForecustDay.day.dailyChanceOfRain
        let chanceOfSnow = weathderForecustDay.day.dailyChanceOfSnow

        return "\(chanceOfRain > chanceOfSnow ? chanceOfRain : chanceOfSnow )%"
    }

    var minDayTemperature: String {
        let min = weathderForecustDay.day.mintempC
            .toRoundedNonfractionalStringValue

        return "\(min)°"
    }

    var maxDayTemperature: String {
        let max = weathderForecustDay.day.maxtempC
            .toRoundedNonfractionalStringValue

        return "\(max)°"
    }

    init(weathderForecustDay: WeatherModel.Forecast.Forecastday) {
        self.weathderForecustDay = weathderForecustDay
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

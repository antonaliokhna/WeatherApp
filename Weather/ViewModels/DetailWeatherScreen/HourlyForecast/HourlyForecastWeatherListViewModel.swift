//
//  HourlyForecaseWeatherListViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/17/22.
//

import Foundation

class HourlyForecastWeatherListViewModel: ObservableObject {
    private let weatherForecastDay: [WeatherModel.Forecast.Forecastday]
    private let currentDate: Date

    private(set) var hourlyForecastRowViewModels: [HourlyForecastRowViewModel]

    init(weatherForecastDay: [WeatherModel.Forecast.Forecastday], currentDate: Date) {
        self.weatherForecastDay = weatherForecastDay
        self.currentDate = currentDate

        let dates = weatherForecastDay.flatMap { forecastDay in
            forecastDay.hour.filter { hour in
                let date = hour.timeEpoch.timeSpanToDate

                return date.addingTimeInterval(60 * 60) >= currentDate
                    && date <= currentDate.addingTimeInterval(60 * 60 * 24)
            }
        }
        
        self.hourlyForecastRowViewModels = dates.map { hour in
            HourlyForecastRowViewModel(hourlyForecastModel: hour)
        }
    }
}

//
//  HourlyForecastRowViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/15/22.
//

import Foundation

class HourlyForecastRowViewModel: ObservableObject {
    private let hourlyForecastModel: WeatherModel.Forecast.Forecastday.Hour

    lazy private var timeHourDate: String = {
        let timeSpanDate = hourlyForecastModel.timeEpoch
        let date = timeSpanDate.timeSpanToDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h a"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let localDate = dateFormatter.string(from: date)
        return localDate
    }()

    var timeHour: String {
        return String(timeHourDate.split(separator: " ").first ?? "--")
    }

    var meridiem: String {
        return String(timeHourDate.split(separator: " ").last ?? "")
    }

    var image: String {
        //TODO: Add logic
        return "cloud"
    }

    var temperature: String {
        return "\(hourlyForecastModel.tempC.toRoundedNonfractionalStringValue)°"
    }

    init(hourlyForecastModel: WeatherModel.Forecast.Forecastday.Hour) {
        self.hourlyForecastModel = hourlyForecastModel
    }
}

//MARK: - Hashable
extension HourlyForecastRowViewModel: Hashable {
    var identifier: String {
        return UUID().uuidString
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }

    static func == (
        lhs: HourlyForecastRowViewModel,
        rhs: HourlyForecastRowViewModel
    ) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

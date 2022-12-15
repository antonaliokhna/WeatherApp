//
//  DailyForecastWeatherListView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DailyForecastWeatherListView: View {
    var dailyForecastViewModel: [DailyForecastWeatherViewModel]
    var body: some View {
        CustomWeatherStackView {
            Label {
                Text("7-DAY FORECAST")
            } icon: {
                Image(systemName: "calendar")
            }
        } contentView: {
            ForEach(Array(dailyForecastViewModel.enumerated()), id: \.0)
            { index, dayForecastViewModel in
                DailyForecastWeatherRowView(
                    dayForecastViewModel: dayForecastViewModel
                )
                if index < dailyForecastViewModel.count - 1 {
                    Divider()
                }
            }
        }
    }
}

struct DailyForecastWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView(
            weatherViewModel:
                WeatherViewModel(cityName: "Moscow")
        )
    }
}

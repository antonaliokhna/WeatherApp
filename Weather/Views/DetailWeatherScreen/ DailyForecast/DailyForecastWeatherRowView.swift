//
//  DailyForecastWeatherRowView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DailyForecastWeatherRowView: View {
    var dayForecastViewModel: DailyForecastWeatherViewModel
    var body: some View {
        HStack {
            Text(dayForecastViewModel.weekDate)
                .font(.title3)
                .frame(width: 56, alignment: .leading)

            Spacer()
            HStack {
                Image(systemName: dayForecastViewModel.weatherImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)

                Text(dayForecastViewModel.precipitationProbability)
                    .font(.footnote)
                    .foregroundColor(.cyan)
            }
            .frame(width: 72, alignment: .leading)

            Spacer()
            HStack() {
                Text(dayForecastViewModel.minDayTemperature)
                    .foregroundColor(.gray)
                    .frame(width: 40)

                Spacer()
                Text(dayForecastViewModel.maxDayTemperature)
                    .frame(width: 40, alignment: .center)
            }
            .font(.title3)
            .frame(width: 104, alignment: .trailing)
        }
    }
}

struct DailyForecastWeatherRowView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView(weatherViewModel: WeatherViewModel(cityName: "Minsk"))
    }
}

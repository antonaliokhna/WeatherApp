//
//  HourlyForecastWeatherRowView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct HourlyForecastWeatherRowView: View {
    @StateObject var hourlyRowViewModel: HourlyForecastRowViewModel
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 0) {
                Text(hourlyRowViewModel.timeHour)
                    .font(.subheadline)
                    .fontWeight(.bold)

                Text(hourlyRowViewModel.meridiem)
                    .font(.footnote)
            }

            Image(systemName: hourlyRowViewModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24, alignment: .center)

            Text(hourlyRowViewModel.temperature)
                .font(.headline)
        }
        .frame(width: 40)
    }
}

struct HourlyForecastWeatherRowView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView()
    }
}

//
//  HourlyForecastWeatherRowView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct HourlyForecastWeatherRowView: View {
    @StateObject var rowViewModel: HourlyForecastRowViewModel
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 0) {
                Text(rowViewModel.timeHour)
                    .font(.subheadline)
                    .fontWeight(.bold)

                Text(rowViewModel.meridiem)
                    .font(.footnote)
            }

            Image(systemName: rowViewModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24, alignment: .center)

            Text(rowViewModel.temperature)
                .font(.headline)
        }
        .frame(width: 40)
    }
}

//struct HourlyForecastWeatherRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        HourlyForecastWeatherRowView()
//    }
//}

//
//  WeatherCityRowView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct WeatherCityRowView: View {
    //@StateObject var viewModel: WeatherViewModel
    var detailWeatherHeaderViewModel: DetailWeatherHeaderViewModel?
    var cityName: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(cityName)
                    .font(.largeTitle)

                Text(self.detailWeatherHeaderViewModel?.currentTime ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Spacer()
                Text(detailWeatherHeaderViewModel?.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .lineLimit(1)

            Spacer()
            VStack(alignment: .trailing) {
                Text(detailWeatherHeaderViewModel?.temperature ?? "")
                    .font(.system(size: 48))
                    .fontWeight(.light)

                Spacer()

                Text(detailWeatherHeaderViewModel?.maxMinTemperature ?? "")
                    .font(.headline)
            }
        }
        .frame(height: 96)
        .padding()
        .background(.bar)
        .cornerRadius(16)
    }
}

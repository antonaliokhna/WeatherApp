//
//  WeatherCityRowView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct WeatherCityRowView: View {
    var detailWeatherHeaderViewModel: DetailWeatherHeaderViewModel?
    var cityName: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(cityName)
                    .font(.title)

                Text(self.detailWeatherHeaderViewModel?.currentTime ?? "")
                    .font(.footnote)
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
                    .font(.system(size: 40))
                    .fontWeight(.light)

                Spacer()

                Text(detailWeatherHeaderViewModel?.maxMinTemperature ?? "")
                    .font(.subheadline)
            }
        }
        .frame(height: 88)
        .padding()
        .background(.bar)
        .cornerRadius(16)
    }
}

struct WeatherCityRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
            .environmentObject(WeatherViewModel(cityName: "Minsk"))
    }
}

//
//  HourlyForecastWeatherListView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct HourlyForecastWeatherListView: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                Text("Snowy conditions expected around 11AM.")
                    .font(.subheadline)

                Divider()
            }
            .padding()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Array(repeating: 0, count: 20), id: \.self) { _ in
                        HourlyForecastWeatherRowView()
                            //.background(.yellow)
                    }
                }
                .padding([.horizontal, .bottom])

            }
        }
        .background(.bar)
        .cornerRadius(16)
    }
}
struct HourlyForecastWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastWeatherListView()
    }
}

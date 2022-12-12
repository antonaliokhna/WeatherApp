//
//  HourlyForecastWeatherListView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct HourlyForecastWeatherListView: View {
    @State private var position: CGRect = CGRect()
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                Label {
                    Text("HOURLY FORECAST")
                } icon: {
                    Image(systemName: "clock")
                }
                .font(.footnote)
                .foregroundColor(.gray)

                Divider()
            }
            .padding()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Array(repeating: 0, count: 20), id: \.self) { _ in
                        HourlyForecastWeatherRowView()
                    }
                }
                .padding([.horizontal, .bottom])
            }
        }
        .background(.bar)
        .cornerRadius(16)
        .offset(y: position.minY >= 144 ? 0 : -position.minY + 144)
        .background(GeometryGetter(rect: $position))


    }
}
struct HourlyForecastWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView()
    }
}

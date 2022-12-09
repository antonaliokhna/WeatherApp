//
//  DailyForecastWeatherListView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DailyForecastWeatherListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "calendar")
                Text("7-DAY FORECAST")
            }
            .font(.footnote)
            .foregroundColor(.gray)

            ForEach(Array(repeating: 0, count: 7), id: \.self) { data in
                Divider()
                DailyForecastWeatherRowView()
            }
        }
        .padding()
        .background(.bar)
        .cornerRadius(16)
    }
}

struct DailyForecastWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastWeatherListView()
    }
}

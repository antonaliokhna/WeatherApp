//
//  DailyForecastWeatherListView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DailyForecastWeatherListView: View {
    private var elemtns = Array(repeating: "", count: 7)
    var body: some View {
        CustomWeatherStackView {
            Label {
                Text("7-DAY FORECAST")
            } icon: {
                Image(systemName: "calendar")
            }
        } contentView: {
            ForEach(Array(elemtns.enumerated()), id: \.0) { index, element in
                DailyForecastWeatherRowView()
                if index < elemtns.count - 1 {
                    Divider()
                }
            }
        }
    }
}

struct DailyForecastWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastWeatherListView()
    }
}

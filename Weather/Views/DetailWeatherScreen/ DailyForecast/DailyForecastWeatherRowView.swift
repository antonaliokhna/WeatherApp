//
//  DailyForecastWeatherRowView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DailyForecastWeatherRowView: View {
    var body: some View {
        HStack {
            Text("Today")
                .font(.title3)
                .frame(width: 56, alignment: .leading)

            Spacer()
            HStack {
                Image(systemName: "cloud")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)

                Text("100%")
                    .font(.footnote)
                    .foregroundColor(.cyan)
            }
            .frame(width: 72, alignment: .leading)

            Spacer()
            HStack() {
                Text("-29°")
                    .foregroundColor(.gray)

                Spacer()
                Text("-12°")
            }
            .font(.title3)
            .frame(width: 104, alignment: .trailing)
        }
    }
}

struct DailyForecastWeatherRowView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastWeatherRowView()
    }
}

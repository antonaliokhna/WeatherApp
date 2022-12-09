//
//  HourlyForecastWeatherRowView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct HourlyForecastWeatherRowView: View {
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 0) {
                Text("12")
                    .font(.subheadline)
                    .fontWeight(.bold)

                Text("AM")
                    .font(.footnote)
            }

            Image(systemName: "cloud.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24, alignment: .center)

            Text("-29°")
                .font(.headline)
        }
        .frame(width: 40)
        //.background(.yellow)
    }
}
struct HourlyForecastWeatherRowView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastWeatherRowView()
    }
}

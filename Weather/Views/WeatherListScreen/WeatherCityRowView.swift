//
//  WeatherCityRowView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct WeatherCityRowView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("12:00 pm")
                    .font(.subheadline)
                Text("Moscow")
                    .font(.title)
            }
            Spacer(minLength: 88)

            Image(systemName: "pencil.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
            Spacer()
            Text("-13°")
                .font(.largeTitle)
                .fontWeight(.light)
        }
        .padding()
    }
}

struct WeatherCityRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCityRowView()
    }
}

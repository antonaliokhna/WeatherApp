//
//  WeatherCityRowView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct WeatherCityRowView: View {
    @StateObject var viewModel: WeatherViewModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("12:00 pm")
                    .font(.subheadline)
                Text(viewModel.cityName)
                    .font(.title)
                    .lineLimit(1)
            }
            .frame(width: 160, alignment: .leading)

            Spacer()
            Image(systemName: "cloud")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)

            Spacer(minLength: 56)
            Text("-99°")
                .font(.largeTitle)
                .fontWeight(.light)
                .frame(width: 72, alignment: .trailing)
        }
        .padding()
        .background(.bar)
        .cornerRadius(16)
    }
}

struct WeatherCityRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCityRowView(viewModel: WeatherViewModel(cityName: "Moscow"))
    }
}

//
//  WeatherListView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct WeatherListView: View {
    @ObservedObject private var viewModel = WeatherListViewModel()
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.weatherCities, id: \.self) { cityName in
                        WeatherCityRowView(
                            viewModel: WeatherCityRowViewModel(
                                cityName: cityName
                            )
                        )
                        .listRowInsets(EdgeInsets())
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle(Text("Weather"))
            .searchable(text: $viewModel.filterCityText) {
            }
        }
    }
}


struct WeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
    }
}

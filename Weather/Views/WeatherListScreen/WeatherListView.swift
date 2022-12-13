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
                        let rowViewModel = WeatherCityRowViewModel(
                            cityName: cityName
                        )
                        NavigationLink {
                            DetailWeatherView()
                           .navigationBarBackButtonHidden(true)
                               // .toolbarBackground(.hidden, for: .bottomBar)
                            //                            DetailWeatherView(
                            //                                weatherCityRowViewModel: rowViewModel
                            //                            )
                        } label: {
                            WeatherCityRowView(
                                viewModel: rowViewModel
                            )
                        }

                        .listRowInsets(EdgeInsets())
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    }
                }
                .listStyle(.inset)
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

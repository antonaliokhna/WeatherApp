//
//  WeatherListView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct WeatherListView: View {
    @ObservedObject private var viewModel = WeatherListViewModel()
    @Environment(\.dismissSearch) private var dismissSearch
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.weatherAddedCities, id: \.self) { cityName in
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
                .searchable(
                    text: $viewModel.filterCityText,
                    prompt: Text("Search for a city")
                ) {
                    ForEach(viewModel.searchCitiesNames, id: \.self) { cityName in
                        Button {
                            viewModel.addCity(name: cityName)
                            dismissSearch()
                        } label: {
                            Text(cityName)
                        }
                        .font(.title3)
                        .foregroundColor(.gray)
                    }
                }
                .scrollIndicators(.hidden)
            }
            .navigationTitle(Text("Weather"))

        }
    }
}


struct WeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
    }
}

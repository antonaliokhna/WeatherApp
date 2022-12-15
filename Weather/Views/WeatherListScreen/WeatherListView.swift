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
    @Environment(\.dismiss) private var dismiss
    @State var isPresentedLa: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.weatherViewModels, id: \.self) { weatherViewModel in
                        NavigationLink {
                            DetailWeatherView(weatherViewModel: weatherViewModel)
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            WeatherCityRowView(
                                viewModel: weatherViewModel
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
                            viewModel.addFavoriteCity(name: cityName)
                            //dismissSearch()
                            isPresentedLa.toggle()
                        } label: {
                            Text(cityName)
                        }
                        .font(.title3)
                        .foregroundColor(.gray)

                        .sheet(isPresented: $isPresentedLa) {
//                            NavigationView {
//                                DetailWeatherContentView(
//                                    topSafeAreaEdge: 60)
//                                    .toolbar {
//                                        ToolbarItem(placement: .cancellationAction) {
//                                            Button("Cancel", action: {})
//                                        }
//                                        ToolbarItem(placement: .confirmationAction) {
//                                            Button("Add", action: {})
//                                        }
//                                    }
//                            }
                        }
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

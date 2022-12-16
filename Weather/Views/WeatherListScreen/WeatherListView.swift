//
//  WeatherListView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct WeatherListView: View {
    @StateObject private var viewModel = WeatherListViewModel()
    @EnvironmentObject var weather: WeatherViewModel
    @Environment(\.dismiss) var dismiss

    @State var isPresentedLa: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.weatherFavoriteCities, id: \.self) { cityName in
                        Button {
                            //isPresentedLa.toggle()
                            self.weather.selectNewCity(cityName: cityName)
                            dismiss()
                        } label: {
                            Text(cityName)
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
                            viewModel.currentSearchCity = cityName
                            //viewModel.addFavoriteCity(name: cityName)
                            isPresentedLa.toggle()
                        } label: {
                            Text(cityName)
                        }
                        .font(.title3)
                        .foregroundColor(.gray)
                    }
                }
                .scrollIndicators(.hidden)
                .sheet(isPresented: $isPresentedLa) {
                    let weatherViewModel = WeatherViewModel(
                        cityName: viewModel.currentSearchCity
                    )
                    GeometryReader { geometry in
                        NavigationView {
                            DetailWeatherContentView(topSafeAreaEdge: geometry.size.height * 0.2)
                                .toolbar {
                                    ToolbarItemGroup(placement: .navigationBarLeading) {
                                        Button("Cancel") {
                                            isPresentedLa.toggle()
                                        }
                                    }

                                    ToolbarItem(placement: .navigationBarTrailing) {
                                        Button("Add") {
                                            viewModel.addFavoriteCity(name: viewModel.currentSearchCity)
                                            isPresentedLa.toggle()
                                        }
                                    }
                                }
                                .environmentObject(weatherViewModel)
                        }
                    }
                }
            }
            .navigationTitle(Text("Weather"))
        }
    }
}


struct WeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
            .environmentObject(WeatherViewModel(cityName: "Minsk"))
    }
}

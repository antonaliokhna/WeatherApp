//
//  WeatherListView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct WeatherListView: View {
    @StateObject private var viewModel = WeatherListViewModel()
    @State private var isPresentedLa: Bool = false

    @EnvironmentObject var weather: WeatherViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.favoriteWeatherViewModels, id: \.self) {
                        viewModel in
                        Button {
                            weather.selectNewCity(viewModel: viewModel)
                            dismiss()
                        } label: {
                            WeatherCityRowView(
                                headerViewModel:
                                    viewModel.detailHeaderVideModel,
                                cityName: viewModel.cityName
                            )
                        }
                        .listRowInsets(EdgeInsets())
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    }
                    .onDelete { index in
                        viewModel.removeFavoriteCity(at: index)
                    }
                }
                .listStyle(.inset)
                .searchable(
                    text: $viewModel.searchCityText,
                    prompt: Text("Search for a city")
                ) {
                    ForEach(viewModel.searchCitiesName, id: \.self) {
                        cityName in
                        Button {
                            viewModel.selectedCityName = cityName
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
                    GeometryReader { geometry in
                        NavigationView {
                            DetailWeatherContentView(
                                topSafeAreaEdge: geometry.size.height * 0.2
                            )
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button {
                                        isPresentedLa.toggle()
                                    } label: {
                                        Text("Close")
                                    }
                                }

                                ToolbarItem(placement: .confirmationAction) {
                                    Button {
                                        viewModel.addFavoriteCity()
                                        isPresentedLa.toggle()
                                    } label: {
                                        Text("Add")
                                    }
                                }
                            }
                        }
                        .environmentObject(
                            viewModel.createOrLoadWeahetViewModelBySelectedCity()
                        )
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

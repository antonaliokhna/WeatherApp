//
//  DetailWeatherContentView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/9/22.
//

import SwiftUI

struct DetailWeatherView: View {
    //Start city (todo: Use UserDefaults)
    @StateObject var weatherViewModel: WeatherViewModel =
        WeatherViewModel(cityName: "Minsk")
    var body: some View {
        GeometryReader  { geometryReader in
            NavigationView {
                let top = geometryReader.safeAreaInsets.top
                DetailWeatherContentView(
                    topSafeAreaEdge: top
                )
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        NavigationLink {
                            //Open map...
                        } label: {
                            Image(systemName: "map")
                        }

                        NavigationLink {
                            WeatherListView()
                        } label: {
                            Image(systemName: "list.bullet")
                        }
                    }
                }
            }
            .environmentObject(weatherViewModel)
            .ignoresSafeArea(.all)
        }
    }
}

struct DetailWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView(weatherViewModel: WeatherViewModel(cityName: "Minsk"))
    }
}

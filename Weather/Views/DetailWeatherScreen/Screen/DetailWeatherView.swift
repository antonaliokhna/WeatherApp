//
//  DetailWeatherContentView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/9/22.
//

import SwiftUI

struct DetailWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    var body: some View {
        GeometryReader { geometry in
            let topEdge = geometry.safeAreaInsets.top
            DetailWeatherContentView(
                weatherViewModel: weatherViewModel,
                topSafeAreaEdge: topEdge
            )
            .ignoresSafeArea(.all)
        }
    }
}

struct DetailWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView(weatherViewModel: WeatherViewModel(cityName: "Minsk"))
    }
}

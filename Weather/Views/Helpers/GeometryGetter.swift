//
//  GeometryGetter.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/10/22.
//

import SwiftUI

struct GeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        return GeometryReader { geometry in
            self.makeView(geometry: geometry)
        }
    }

    func makeView(geometry: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            self.rect = geometry.frame(in: .global)
        }

        return Color.clear
    }
}

struct GeometryGetter_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView(weatherViewModel: WeatherViewModel())
    }
}

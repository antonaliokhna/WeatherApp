//
//  DetailWeatherContentView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/9/22.
//

import SwiftUI

struct DetailWeatherView: View {
    var body: some View {
        GeometryReader { geometry in
            let topEdge = geometry.safeAreaInsets.top
            DetailWeatherContentView(topSafeAreaEdge: topEdge)
                .ignoresSafeArea(.all)
        }
    }
}

struct DetailWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView()
    }
}

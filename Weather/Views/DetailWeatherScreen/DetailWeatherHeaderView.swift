//
//  DetailWeatherHeaderView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DetailWeatherHeaderView: View {
    var body: some View {
        VStack {
            Text("Minsk")
                .font(.largeTitle)

            Text("-4°")
                .font(.system(size: 72, weight: .light))

            Text("Cloudy")
                .font(.title2)

            HStack {
                Text("H: 0°")
                Text("L: -4°")
            }
            .font(.title3)
            .fontWeight(.light)
        }
    }
}
struct DetailWeatherHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherHeaderView()
    }
}

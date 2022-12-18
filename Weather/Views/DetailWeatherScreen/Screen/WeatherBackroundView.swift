//
//  WeatherBackroundView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/19/22.
//

import SwiftUI

struct WeatherBackroundView: View {
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    var body: some View {
        let cutomColorScheme = colorScheme == .dark
        ? ColorTheme.dark
        : ColorTheme.white

        let gradient = Gradient(colors: cutomColorScheme)
        let linearGradient = LinearGradient(
            gradient: gradient,
            startPoint: .top,
            endPoint: .bottom
        )

        let background = Rectangle()
            .fill(linearGradient)
            .edgesIgnoringSafeArea(.all)

        return background
    }
}

struct WeatherBackroundView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherBackroundView()
    }
}

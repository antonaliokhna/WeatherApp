//
//  DescriptionDetailWeatherItemView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DescriptionDetailWeatherItemView: View {
    var topOffsetSafeArea: CGFloat = 0
    var body: some View {
        CustomWeatherStackView(topOffsetSafeArea: topOffsetSafeArea) {
            Label {
                Text("FEELS LIKE")
            } icon: {
                Image(systemName: "thermometer")
            }
        } contentView: {
            Text("-5°")
                .font(.system(size: 40))

            Spacer()
            Text("Wind is making it feel colder.")
                .font(.subheadline)
        }
        .frame(height: 176)
    }
}

struct DescriptionDetailWeatherItemView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionDetailWeatherItemView()
    }
}

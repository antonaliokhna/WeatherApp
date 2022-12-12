//
//  DescriptionDetailWeatherItemView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DescriptionDetailWeatherItemView: View {
    var body: some View {
        CustomWeatherStackView {
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
        .frame(width: .infinity, height: 176)
    }
}

struct DescriptionDetailWeatherItemView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionDetailWeatherItemView()

    }
}

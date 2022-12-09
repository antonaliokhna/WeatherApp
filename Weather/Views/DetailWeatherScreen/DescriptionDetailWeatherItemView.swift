//
//  DescriptionDetailWeatherRowView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DescriptionDetailWeatherItemView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("FEELS LIKE")
                .font(.footnote)
                .foregroundColor(.gray)

            Divider()
            Text("-5°")
                .font(.system(size: 40))

            Spacer()
            Text("Wind is making it feel colder.")
                .font(.subheadline)
        }
        .padding()
        .frame(width: 176, height: 176)
        .background(.bar)
        .cornerRadius(16)
    }
}

struct DescriptionDetailWeatherRowView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionDetailWeatherItemView()
    }
}

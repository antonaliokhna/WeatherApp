//
//  DescriptionDetailWeatherItemView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DescriptionDetailWeatherItemView: View {
    @StateObject var descriptionItemViewModel: DescriptionItemViewModel
    
    let topOffsetSafeArea: CGFloat
    var body: some View {
        CustomWeatherStackView(topOffsetSafeArea: topOffsetSafeArea) {
            Label {
                Text(descriptionItemViewModel.textLabel)
            } icon: {
                Image(systemName: descriptionItemViewModel.imageLabel)
            }
        } contentView: {
            Text("\(descriptionItemViewModel.value)")
                .font(.system(size: 40))

            Spacer()
            Text(descriptionItemViewModel.description)
                .font(.subheadline)
        }
        .frame(height: 176)
    }
}

struct DescriptionDetailWeatherItemView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionDetailWeatherItemView(
            descriptionItemViewModel: DescriptionItemViewModel(
                textLabel: "Some value",
                imageLabel: "Cloud",
                value: "-11°",
                description: "Some text"
            ),
            topOffsetSafeArea: 0
        )
    }
}

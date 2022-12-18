//
//  DescriptionDetailWeatherItemView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DescriptionDetailWeatherItemView: View {
    @StateObject var viewModel: DescriptionItemViewModel
    
    let topOffsetSafeArea: CGFloat
    var body: some View {
        CustomWeatherStackView(topOffsetSafeArea: topOffsetSafeArea) {
            Label {
                Text(viewModel.textLabel)
            } icon: {
                Image(systemName: viewModel.imageLabel)
            }
        } contentView: {
            Text("\(viewModel.value)")
                .font(.system(size: 40))

            Spacer()
            Text(viewModel.description)
                .font(.subheadline)
        }
        .frame(height: 176)
    }
}

struct DescriptionDetailWeatherItemView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionDetailWeatherItemView(
            viewModel: DescriptionItemViewModel(
                textLabel: "Some value",
                imageLabel: "Cloud",
                value: "-11°",
                description: "Some text"
            ),
            topOffsetSafeArea: 0
        )
    }
}

//
//  CustomWeatherStackView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/10/22.
//

import SwiftUI

struct CustomWeatherStackView<Label: View, Content: View>: View {
    @State private var position: CGRect = CGRect()

    private var topOffsetSafeArea: CGFloat
    private var labelView: Label
    private var contentView: Content

    init(
        topOffsetSafeArea: CGFloat,
        @ViewBuilder labelView: @escaping () -> Label,
        @ViewBuilder contentView: @escaping () -> Content
    ) {
        self.topOffsetSafeArea = topOffsetSafeArea
        self.labelView = labelView()
        self.contentView = contentView()
    }

    var body: some View {
        VStack(alignment: .leading) {
            labelView
                .font(.footnote)
                .foregroundColor(.gray)
                .lineLimit(1)
                .zIndex(1)

            VStack(alignment: .leading) {
                Divider()
                contentView
                    .zIndex(0)
            }
            .background(GeometryGetter(rect: $position))
            .offset(
                y: position.minY <= 294 + topOffsetSafeArea
                ? -(-position.minY + 294 + topOffsetSafeArea)
                : 0
            )
            .clipped()
        }
        .padding()
        .background(.bar)
        .cornerRadius(16)
        .offset(
            y: position.minY <= 294 + topOffsetSafeArea
            ? -position.minY + 294 + topOffsetSafeArea
            : 0
        )
        .cornerRadius(16)
    }
}

struct CustomWeatherStackView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView(weatherViewModel: WeatherViewModel())
    }
}

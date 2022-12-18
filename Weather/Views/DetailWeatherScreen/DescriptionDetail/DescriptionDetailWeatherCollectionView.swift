//
//  DescriptionDetailWeatherCollectionView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/12/22.
//

import SwiftUI

struct DescriptionDetailWeatherCollectionView: View {
    @StateObject var descriptionItemCollectionViewModel: DescriptionItemCollectionViewModel
    let topOffsetSafeArea: CGFloat
    private let gridItemLayout = Array(
        repeating: GridItem(.flexible()),
        count: 2
    )
    var body: some View {
        LazyVGrid(columns: gridItemLayout) {
            //TODO: - AAAAAAAA Its Crutch!!!
            ForEach(
                0..<descriptionItemCollectionViewModel
                    .descriptionItemsViewModel.count
            ) { _ in
                DescriptionDetailWeatherItemView(
                    descriptionItemViewModel: descriptionItemCollectionViewModel
                        .getDescriptionItemViewModel(),
                    topOffsetSafeArea: topOffsetSafeArea
                )
            }
        }
    }
}

struct DescriptionDetailWeatherCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView()
    }
}

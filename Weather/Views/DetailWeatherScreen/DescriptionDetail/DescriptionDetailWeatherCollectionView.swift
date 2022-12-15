//
//  DescriptionDetailWeatherCollectionView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/12/22.
//

import SwiftUI

struct DescriptionDetailWeatherCollectionView: View {
    private let gridItemLayout = Array(
        repeating: GridItem(.flexible()),
        count: 2
    )

    let viewModels = [1,2,3,4,5,6,7,8,9] //Test
    var body: some View {
        LazyVGrid(columns: gridItemLayout) {
            ForEach(viewModels, id: \.self) { _ in
                DescriptionDetailWeatherItemView()
            }
        }
    }
}

struct DescriptionDetailWeatherCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionDetailWeatherCollectionView()
    }
}

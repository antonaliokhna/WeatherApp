//
//  HourlyForecastWeatherListView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct HourlyForecastWeatherListView: View {
    @StateObject var hourlyListViewModel: HourlyForecastWeatherListViewModel
    let topOffsetSafeArea: CGFloat

    @State private var position: CGRect = CGRect()
    private let row = GridItem(.fixed(50), spacing: 5, alignment: .center)
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                Label {
                    Text("HOURLY FORECAST")
                } icon: {
                    Image(systemName: "clock")
                }
                .font(.footnote)
                .foregroundColor(.gray)

                Divider()
            }
            .padding()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(
                        hourlyListViewModel.hourlyForecastRowViewModels,
                        id: \.self
                    ) {
                        viewModel in
                        HourlyForecastWeatherRowView(
                            hourlyRowViewModel: viewModel
                        )
                    }
                }
                .padding([.horizontal, .bottom])
            }
        }
        .background(.bar)
        .cornerRadius(16)
        .offset(
            y: position.minY <= 80 + topOffsetSafeArea
            ? -position.minY + 80 + topOffsetSafeArea
            : 0
        )
        .background(GeometryGetter(rect: $position))
    }
}

struct HourlyForecastWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView()
    }
}

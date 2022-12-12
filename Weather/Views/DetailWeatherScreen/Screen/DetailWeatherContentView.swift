//
//  DetailWeatherContentView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DetailWeatherContentView: View {
    @State var topSafeAreaEdge: CGFloat
    @State private var hourlyForecastBlock: CGRect = CGRect()
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false)  {
                VStack(spacing: 16) {
                    DetailWeatherHeaderView(
                        topSafeAreaEdge: topSafeAreaEdge,
                        hourlyForecastPosition: $hourlyForecastBlock
                    )

                    HourlyForecastWeatherListView()
                        .background(GeometryGetter(rect: $hourlyForecastBlock))

                    DailyForecastWeatherListView()
                    DescriptionDetailWeatherCollectionView()
                }
                .padding(.top, topSafeAreaEdge)
                .padding([.horizontal])
                .shadow(
                    color: (colorScheme == .dark ? Color.white : Color.black)
                        .opacity(0.2),
                    radius: 1
                )
            }

        }
    }
}

struct DetailWeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView()
    }
}

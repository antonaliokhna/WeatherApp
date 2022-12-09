//
//  DetailWeatherView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DetailWeatherView: View {
    private var gridItemLayout = Array(repeating: GridItem(.flexible()), count: 2)
    var body: some View {
        ZStack {
            //Color.blue
            //.edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false)  {
                VStack(spacing: 16) {
                    DetailWeatherHeaderView()
                    HourlyForecastWeatherListView()
                    DailyForecastWeatherListView()

                    LazyVGrid(columns: gridItemLayout) {
                        DescriptionDetailWeatherItemView()
                        DescriptionDetailWeatherItemView()
                        DescriptionDetailWeatherItemView()
                        DescriptionDetailWeatherItemView()
                        DescriptionDetailWeatherItemView()
                    }
                }
            }
            .padding()
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct DetailWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView()
    }
}

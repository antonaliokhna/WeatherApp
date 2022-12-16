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

    @EnvironmentObject var weatherViewModel: WeatherViewModel
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    var body: some View {
        ZStack {
            switch self.weatherViewModel.status {
            case .loading:
                VStack(alignment: .center, spacing: 32) {
                    ProgressView()
                        .scaleEffect(2)

                    Text("Weather data loading...")
                        .font(.title2)
                }
                .frame(maxWidth: .infinity)

            case .sucsess:
                ScrollView(showsIndicators: false)  {
                    VStack(spacing: 16) {
                        DetailWeatherHeaderView(
                            detailWeatherHeaderViewModel:
                                weatherViewModel.detailHeaderVideModel1!,
                            topSafeAreaEdge: topSafeAreaEdge,
                            hourlyForecastPosition: $hourlyForecastBlock
                        )
                        .padding(.bottom, topSafeAreaEdge * 2)

                        HourlyForecastWeatherListView(topOffsetSafeArea: topSafeAreaEdge)
                            .background(GeometryGetter(rect: $hourlyForecastBlock))

                        DailyForecastWeatherListView(
                            dailyForecastViewModel: weatherViewModel.dailyForecastViewModels, topOffsetSafeArea: topSafeAreaEdge
                        )
                        DescriptionDetailWeatherCollectionView(topOffsetSafeArea: topSafeAreaEdge)
                    }
                    .shadow(
                        color: (colorScheme == .dark ? Color.white : Color.black)
                            .opacity(0.2),
                        radius: 1
                    )
                }

            case .failed(let error):
                VStack(alignment: .center, spacing: 16) {
                    Image(systemName: "network")
                        .font(.largeTitle)

                    Text("Weather Unavailable")
                        .font(.title)
                        .fontWeight(.medium)

                    Text(error.errorDescription!)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)

                    Button {
                        self.weatherViewModel.retryFetchWeatherModel()
                    } label: {
                        Text("Retry")
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding([.horizontal])
    }
}

struct DetailWeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView()
            .environmentObject(WeatherViewModel(cityName: "Minsk"))
    }
}

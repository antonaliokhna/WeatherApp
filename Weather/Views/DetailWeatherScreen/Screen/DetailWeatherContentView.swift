//
//  DetailWeatherContentView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DetailWeatherContentView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    @State var topSafeAreaEdge: CGFloat
    @State private var hourlyForecastBlock: CGRect = CGRect()
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    var body: some View {
        ZStack {
            switch weatherViewModel.status {
            case .loading:
                VStack(alignment: .center, spacing: 32) {
                    ProgressView()
                        .scaleEffect(2)

                    Text("Weather data loading...")
                        .font(.title2)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, topSafeAreaEdge * 4)

            case .sucsess:
                ScrollView(showsIndicators: false)  {
                    VStack(spacing: 16) {
                        Text(weatherViewModel.cityName)
                        DetailWeatherHeaderView(
                            topSafeAreaEdge: topSafeAreaEdge,
                            hourlyForecastPosition: $hourlyForecastBlock
                        )

                        HourlyForecastWeatherListView()
                            .background(GeometryGetter(rect: $hourlyForecastBlock))

                        DailyForecastWeatherListView()
                        DescriptionDetailWeatherCollectionView()
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
                        weatherViewModel.retryFetchWeatherModel()
                    } label: {
                        Text("Retry")
                    }

                }
                .frame(maxWidth: .infinity)
                .padding(.top, topSafeAreaEdge * 4)
            }
        }
        .padding(.top, topSafeAreaEdge)
        .padding([.horizontal])
    }
}

struct DetailWeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView(weatherViewModel: WeatherViewModel(cityName: "Minsk"))
    }
}

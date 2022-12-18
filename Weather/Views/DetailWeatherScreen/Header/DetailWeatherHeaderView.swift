//
//  DetailWeatherHeaderView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DetailWeatherHeaderView: View {
    var detailWeatherHeaderViewModel: WeatherHeaderViewModel
    var topSafeAreaEdge: CGFloat

    @State private var position: CGRect = CGRect()
    @State private var weatherAndTemperatureBlock: CGRect = CGRect()
    @State private var temperatureBlock: CGRect = CGRect()
    @State private var weatherBlock: CGRect = CGRect()
    @State private var coordinatesBlock: CGRect = CGRect()

    @Binding var hourlyForecastPosition: CGRect

    private let maxDifferenceY: CGFloat = 50
    private var topOffset: CGFloat {
        return self.position.minY - topSafeAreaEdge
    }

    var body: some View {
        VStack(alignment: .center) {
            Text(detailWeatherHeaderViewModel.cityName)
                .font(.largeTitle)

            ZStack(alignment: .top) {
                Text(detailWeatherHeaderViewModel.temperatureAndDescription)
                    .font(.title3)
                    .background(GeometryGetter(
                        rect: $weatherAndTemperatureBlock)
                    )
                    .opacity(
                        getDifferenceOpacity(
                            currentValue: temperatureBlock.maxY
                        ) <= 0
                        ? 1 - getDifferenceOpacity(
                            currentValue: weatherAndTemperatureBlock.maxY + weatherAndTemperatureBlock.height / 2)
                        : 0
                    )

                HStack {
                    if detailWeatherHeaderViewModel.isNegativeTemperature {
                        Text("-")
                    }
                    Text(detailWeatherHeaderViewModel.temperatureWithoutSign)
                }
                .font(.system(size: 72, weight: .light))
                .background(GeometryGetter(rect: $temperatureBlock))
                .opacity((getDifferenceOpacity(
                    currentValue: temperatureBlock.maxY))
                )
            }
            //Text(topOffset.description)

            Text(detailWeatherHeaderViewModel.description)
                .font(.title2)
                .background(GeometryGetter(rect: $weatherBlock))
                .opacity(getDifferenceOpacity(
                    currentValue: weatherBlock.maxY
                ))

            Text(detailWeatherHeaderViewModel.maxMinTemperature)
                .font(.title2)
                .fontWeight(.light)
                .background(GeometryGetter(rect: $coordinatesBlock))
                .opacity(getDifferenceOpacity(
                    currentValue: coordinatesBlock.maxY
                ))
        }
        .offset(y: topSafeAreaEdge)
        .offset(
            y: topOffset < 0
            ? -topOffset
            : (-topOffset / UIScreen.main.bounds.width) * 100
        )
        .offset(y: getOffset())
        .background(GeometryGetter(rect: $position))
    }


}
struct DetailWeatherHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView(weatherViewModel: WeatherViewModel(cityName: "Minsk"))
    }
}

//MARK: - View functions
private extension DetailWeatherHeaderView {
    private func getDifferenceOpacity(currentValue: CGFloat) -> CGFloat {
        let differenceY = hourlyForecastPosition.minY - currentValue
        guard differenceY < maxDifferenceY else { return 1 }

        let progress = differenceY / maxDifferenceY

        return (progress <= 1 ? progress : 1)
    }

    private func getOffset() -> CGFloat {
        guard topOffset < 0 else { return 0 }

        let progress = (-topOffset / topSafeAreaEdge) / 2
        let offset = (progress <= 1 ? progress : 1) * topSafeAreaEdge

        return -offset
    }
}

//
//  DetailWeatherHeaderView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DetailWeatherHeaderView: View {
    var detailWeatherHeaderViewModel: DetailWeatherHeaderViewModel
    @State var topSafeAreaEdge: CGFloat

    @State private var position: CGRect = CGRect()
    @State private var weatherAndTemperatureBlock: CGRect = CGRect()
    @State private var temperatureBlock: CGRect = CGRect()
    @State private var weatherBlock: CGRect = CGRect()
    @State private var coordinatesBlock: CGRect = CGRect()

    @Binding var hourlyForecastPosition: CGRect

    private let maxDifferenceY: CGFloat = 50
    private var offset: CGFloat {
        return self.position.minY - topSafeAreaEdge
    }

    var body: some View {
        VStack {
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

                Text(detailWeatherHeaderViewModel.temperature)
                    .font(.system(size: 72, weight: .light))
                    .background(GeometryGetter(rect: $temperatureBlock))
                    .opacity((getDifferenceOpacity(
                        currentValue: temperatureBlock.maxY))
                    )
            }

            Text(detailWeatherHeaderViewModel.description)
                .font(.title2)
                .background(GeometryGetter(rect: $weatherBlock))
                .opacity(getDifferenceOpacity(
                    currentValue: weatherBlock.maxY
                ))

            Text(detailWeatherHeaderViewModel.maxMinTemperature)
            .font(.title3)
            .fontWeight(.light)
            .background(GeometryGetter(rect: $coordinatesBlock))
            .opacity(getDifferenceOpacity(
                currentValue: coordinatesBlock.maxY
            ))
        }
        .padding(.vertical, 64)
        .offset(y: -offset)
        .offset(y: offset > 0 ?
                (offset / UIScreen.main.bounds.width) * 50 : 0)
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
        guard offset < 0 else { return 0 }

        let progress = (-offset / topSafeAreaEdge) / 2
        let offset = (progress <= 1 ? progress : 1) * topSafeAreaEdge

        return -offset
    }
}

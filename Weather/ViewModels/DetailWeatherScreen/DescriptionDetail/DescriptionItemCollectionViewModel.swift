//
//  DescriptionItemCollectionViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/18/22.
//

import Foundation

class DescriptionItemCollectionViewModel: ObservableObject {
    private let currentWeatherModel: WeatherModel.Current
    private(set) var descriptionItemsViewModel: [DescriptionItemViewModel] = []

    init(currentWeatherModel: WeatherModel.Current) {
        self.currentWeatherModel = currentWeatherModel

        self.descriptionItemsViewModel = [
            self.getWindMph(),
            self.getWindDegree(),
            self.getWindDegree(),
            self.getAirHumidity(),
            self.getPressureMb(),
            self.getVisibleMiles(),
            self.getPrecipitationMm(),
            self.getCloudy(),
        ]
    }

    //TODO: - AAAAAAAA Its Crutch!!!
    func getDescriptionItemViewModel() -> DescriptionItemViewModel {
        let firstElement = descriptionItemsViewModel.removeFirst()

        return firstElement
    }
}

//MARK: - Gettable private functions
extension DescriptionItemCollectionViewModel {
    private func getWindMph() -> DescriptionItemViewModel {
        let value = currentWeatherModel.windMph
            .toRoundedNonfractionalStringValue

        return DescriptionItemViewModel(
            textLabel: "Wind speed",
            imageLabel: "wind",
            value: value,
            description: "Calm northeast wind, gusty in some places."
        )
    }

    private func getWindDegree() -> DescriptionItemViewModel {
        return DescriptionItemViewModel(
            textLabel: "Wind degree",
            imageLabel: "location",
            value: currentWeatherModel.windDegree.toStringValue,
            description: "Statistical mean wind direction."
        )
    }

    private func getPressureMb() -> DescriptionItemViewModel {
        return DescriptionItemViewModel(
            textLabel: "Pressure",
            imageLabel: "rectangle.compress.vertical",
            value: currentWeatherModel.pressureMb.toStringValue,
            description: "Pressure relative to the mercury column."
        )
    }

    private func getPrecipitationMm() -> DescriptionItemViewModel {
        return DescriptionItemViewModel(
            textLabel: "Precipitation",
            imageLabel: "water.waves",
            value: currentWeatherModel.precipMm
                .toRoundedNonfractionalStringValue,
            description: "Amount of precipitation in millimeters."
        )
    }

    private func getAirHumidity() -> DescriptionItemViewModel {
        return DescriptionItemViewModel(
            textLabel: "Air humidity",
            imageLabel: "humidity",
            value: currentWeatherModel.humidity.toStringValue,
            description: "Average statistical humidity."
        )
    }

    private func getCloudy() -> DescriptionItemViewModel {
        return DescriptionItemViewModel(
            textLabel: "Cloud",
            imageLabel: "cloud",
            value: currentWeatherModel.cloud.toStringValue,
            description: "Cloudy."
        )
    }

    private func getVisibleMiles() -> DescriptionItemViewModel {
        let value = currentWeatherModel.visMiles
        return DescriptionItemViewModel(
            textLabel: "Visible",
            imageLabel: "eye.fill",
            value: "\(value) Mph",
            description: "Average visibility range."
        )
    }

    private func getUvIndex() -> DescriptionItemViewModel {
        return DescriptionItemViewModel(
            textLabel: "UV index",
            imageLabel: "sun.max.fill",
            value: currentWeatherModel.uv.toStringValue,
            description: "Sunshine Index."
        )
    }

    private func getGustMph() -> DescriptionItemViewModel {
        return DescriptionItemViewModel(
            textLabel: "Gusts of wind",
            imageLabel: "windshield.rear.and.heat.waves",
            value: currentWeatherModel.gustMph.toRoundedNonfractionalStringValue,
            description: "Gusts of wind."
        )
    }
}

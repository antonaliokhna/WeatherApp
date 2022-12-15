//
//  WeatherModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation

struct WeatherModel: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast

    struct Location: Codable {
        let name: String
        let country: String
        let lat: Double
        let lon: Double
        let localtimeEpoch: Int
    }

    struct Current: Codable {
        let tempC: Double
        let isDay: Int
        let windMph: Double
        let windDegree: Int
        let windDir: String
        let pressureMb: Int
        let pressureIn: Double
        let precipMm: Double
        let precipIn: Int
        let humidity: Int
        let cloud: Int
        let feelslikeC: Double
        let visMiles: Int
        let uv: Int
        let gustMph: Double
        let condition: Condition

        struct Condition: Codable {
            let text: String
            let icon: String
            let code: Int
        }
    }

    struct Forecast: Codable {
        let forecastday: [Forecastday]

        struct Forecastday: Codable {
            let dateEpoch: Int
            let day: Day

            struct Day: Codable {
                let maxtempC: Double
                let maxtempF: Double
                let mintempC: Double
                let mintempF: Double
                let avgtempC: Double
                let avgtempF: Double
                let maxwindMph: Double
                let maxwindKph: Double
                let totalprecipMm: Double
                let totalprecipIn: Double
                let totalsnowCm: Double
                let avgvisKm: Double
                let avgvisMiles: Double
                let avghumidity: Int
                let dailyWillItRain: Int
                let dailyChanceOfRain: Int
                let dailyWillItSnow: Int
                let dailyChanceOfSnow: Int
                let condition: Current.Condition
                let uv: Int
            }

            let astro: Astro

            struct Astro: Codable {
                let sunrise: String
                let sunset: String
                let moonrise: String
                let moonset: String
                let moonPhase: String
                let moonIllumination: String
            }

            let hour: [Hour]

            struct Hour: Codable {
                let timeEpoch: Int
                let time: String
                let tempC: Double
                let isDay: Int
                let condition: Current.Condition
                let windMph: Double
                let windKph: Double
                let windDegree: Int
                let windDir: String
                let pressureMb: Int
                let pressureIn: Double
                let precipMm: Double
                let precipIn: Double
                let humidity: Int
                let cloud: Int
                let feelslikeC: Double
                let feelslikeF: Double
                let windchillC: Double
                let windchillF: Double
                let heatindexC: Double
                let heatindexF: Double
                let dewpointC: Double
                let dewpointF: Double
                let willItRain: Int
                let chanceOfRain: Int
                let willItSnow: Int
                let chanceOfSnow: Int
                let visKm: Int
                let visMiles: Int
                let gustMph: Double
                let gustKph: Double
                let uv: Int            }
        }
    }
}

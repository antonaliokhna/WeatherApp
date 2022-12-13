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
        let name: String //"name": "Minsk",
        let country: String //"country": "Belarus",
        let lat: Double //"lat": 53.9,
        let lon: Double // "lon": 27.57,
        let localtimeEpoch: Int // "localtime_epoch": 1670887200,
    }

    struct Current: Codable {
        let tempC: Double // "temp_c": -3,
        let isDay: Bool // "is_day": 0,
        let windMph: Double // "wind_mph": 13.6,
        let windDegree: Int //"wind_degree": 190,
        let windDir: String //"wind_dir": "S",
        let pressureMb: Int // "pressure_mb": 999,
        let pressureIn: Double //"pressure_in": 29.5,
        let precipMm: Double // "precip_mm": 0.1,
        let precipIn: Int //"precip_in": 0,
        let humidity: Int // "humidity": 93,
        let cloud: Int // "cloud": 100,
        let feelslikeC: Double // "feelslike_c": -9.5,
        let visMiles: Int // "vis_miles": 4,
        let uv: Int //"uv": 1,
        let gustMph: Double // "gust_mph": 20.8,


        struct Condition: Codable {
            let text: String //"text": "Overcast",
            let icon: String //"icon": "//cdn.weatherapi.com/weather/64x64/night/122.png",
            let code: Int // "code": 1009
        }
    }

    struct Forecast: Codable {
        let forecastday: Forecastday

        struct Forecastday: Codable {
            let dateEpoch: Int // "date_epoch": 1670889600,
            let uv: Int // "uv": 1

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
                let avgvisKm: Int
                let avgvisMiles: Int
                let avghumidity: Int
                let dailyWillItRain: Int
                let dailyChanceOfRain: Int
                let dailyWillItSnow: Int
                let dailyChanceOfSnow: Int
                let condition: Current.Condition
            }

            struct Astro: Codable {
                let sunrise: String //"09:20 AM",
                let sunset: String // "04:48 PM",
                let moonrise: String //"09:40 PM",
                let moonset: String //"01:12 PM",
                let moonPhase: String //"Waning Gibbous",
                let moonIllumination: Int // "62"
            }

            struct Hour: Codable {
                let timeEpoch: Int // 1670878800,
                let time: String // "2022-12-13 00:00",
                let tempC: Double //-4.6,
                let isDay: Bool // 0,
                let condition: Current.Condition
                let windMph: Double //14.8,
                let windKph: Double //23.8,
                let windDegree: Int // 208,
                let windDir: String // "SSW",
                let pressureMb: Int //1001,
                let pressureIn: Double // 29.54,
                let precipMm: Int // 0,
                let precipIn: Int // 0,
                let humidity: Int // 93,
                let cloud: Int // 100,
                let feelslikeC: Double // -11.6,
                let feelslikeF: Double // 11.1,
                let windchillC: Double // -11.6,
                let windchillF: Double // 11.1,
                let heatindexC: Double // -4.6,
                let heatindexF: Double // 23.7,
                let dewpointC: Double //-5.5,
                let dewpointF: Double //22.1,
                let willItRain: Int // 0,
                let chanceOfRain: Int // 0,
                let willItSnow: Int // 0,
                let chanceOfSnow: Int // 0,
                let visKm: Int // 10,
                let visMiles: Int // 6,
                let gustMph: Double // 22.8,
                let gustKph: Double //36.7,
                let uv: Int //1
            }
        }
    }
}

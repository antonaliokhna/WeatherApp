//
//  DetailWeatherView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct DetailWeatherView: View {
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)

            VStack {
                DetailWeatherHeaderView()
                HourlyForecastWeatherListView()

                ScrollView {
                  DailyForecastWeatherListView()
                }

                DescriptionDetailWeatherRowView()
                DescriptionDetailWeatherRowView()
                DescriptionDetailWeatherRowView()
            }

        }

    }
}

struct DetailWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView()
    }
}

struct DetailWeatherHeaderView: View {
    var body: some View {
        VStack {
            Text("Minsk")
                .font(.largeTitle)

            Text("-4°")
                .font(.system(size: 72, weight: .light))

            Text("Cloudy")
                .font(.title2)

            HStack {
                Text("H: 0°")
                Text("L: -4°")
            }
            .font(.title3)
            .fontWeight(.light)
        }
    }
}

struct HourlyForecastWeatherRowView: View {
    var body: some View {
        VStack {
            Text("4am")
            Image(systemName: "cloud")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)

            Text("-4°")
        }
        .padding(.all, 0)
    }
}

struct HourlyForecastWeatherListView: View {

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(repeating: 0, count: 20), id: \.self) { _ in
                    HourlyForecastWeatherRowView()
                    Spacer(minLength: 24)
                }
            }.padding(.horizontal, 24)
        }
    }
}

struct DailyForecastWeatherRowView: View {
    var body: some View {
        HStack {
            Text("Today")

            Spacer(minLength: 80)

            HStack {
                Image(systemName: "cloud")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                Spacer()
                Text("100%")
                    .font(.subheadline)
                    .foregroundColor(.cyan)
            }
            .frame(width: 88)

            Spacer()

            Text("0")

            Spacer().frame(width: 34)
            Text("-4")
        }
        .padding(.horizontal, 24)
    }
}

struct DailyForecastWeatherListView: View {

    var body: some View {
        VStack {
            ForEach(Array(repeating: 0, count: 7), id: \.self) { data in
                DailyForecastWeatherRowView()
            }
        }
    }
}

struct DescriptionDetailWeatherRowView: View {
    var body: some View {
        HStack(spacing: 120) {
            VStack(alignment: .leading) {
                Text("SUNRISE")
                    .font(.caption)
                Text("07:05").font(.title).padding(0)
            }

            VStack(alignment: .leading) {
                Text("SUNRISE")
                    .font(.caption)

                Text("07:05").font(.title).padding(0)
            }
        }
    }
}

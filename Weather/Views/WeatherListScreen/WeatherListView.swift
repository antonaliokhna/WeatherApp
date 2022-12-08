//
//  ContentView.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/8/22.
//

import SwiftUI

struct WeatherListView: View {
    @State private var cityTextField: String = ""

    private var cityList = ["Warsaw","Bucharest","Martuni","Shah Alam","Karmie","Budapest","Munich","Netivot","Santa Cruz de la Sierra","Porto Alegre","Kfar Yona","Palermo","Bremen","Jermuk","Beit Shemesh","Florence","Utrecht","Buenos Aires","Guayaquil","Rosario","Soledad","Subang Jaya","Valencia","Pasir Gudang","Akhtala"]

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(cityList, id: \.self) { city in
                        WeatherCityRowView()
                            .listRowInsets(EdgeInsets())
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle(Text("Weather"))
            .searchable(text: $cityTextField) {

            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
    }
}

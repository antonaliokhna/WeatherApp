//
//  LocalDataFetcher.swift
//  Weather
//
//  Created by Anton Aliokhna on 1/2/23.
//

import Foundation

class LocalDataService {

    typealias Parameters = [String: Any]

    let dataFetcher: DataFetcher
    let dataPusher: DataPusher

    init(
        dataFetcher: DataFetcher = DataFetcher(
            service: UserDefaultsService()
        ),
        dataPusher: DataPusher = DataPusher()
    ) {
        self.dataFetcher = dataFetcher
        self.dataPusher = dataPusher
    }

    func fetchCityNames(
        by key: String,
        completion: @escaping (Result<[String], CustomError>) -> Void
    ) {
        dataFetcher.fetchGenericData(
            stringUrl: key,
            response: completion
        )
    }

    func pushCities(
        from: String,
        names: [String],
        completion: @escaping (Result<Data, CustomError>) -> Void
    ) {
        dataPusher.pushGenericValue(
            url: from,
            value: names
        ) { response in
            completion(response)
        }
    }
}

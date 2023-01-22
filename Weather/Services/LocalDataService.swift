//
//  LocalDataFetcher.swift
//  Weather
//
//  Created by Anton Aliokhna on 1/2/23.
//

import Foundation

class LocalDataService {

    typealias Parameters = [String: Any]

    let dataFetcher: DataFetcherType
    let dataPusher: DataPusherType

    init(
        dataFetcher: DataFetcherType = DataFetcher(
            service: UserDefaultsService()
        ),
        dataPusher: DataPusherType = DataPusher(
            service: UserDefaultsService()
        )
    ) {
        self.dataFetcher = dataFetcher
        self.dataPusher = dataPusher
    }

    func fetchCityName(
        by key: String,
        completion: @escaping (Result<String, CustomError>) -> Void
    ) {
        dataFetcher.fetchGenericData(
            url: key,
            parameters: [:],
            response: completion
        )
    }

    func fetchCityNames(
        by key: String,
        completion: @escaping (Result<[String], CustomError>) -> Void
    ) {
        dataFetcher.fetchGenericData(
            url: key,
            parameters: [:],
            response: completion
        )
    }

    func pushCity(
        whereTo url: String,
        name: String,
        completion: @escaping (Result<Data, CustomError>) -> Void
    ) {
        dataPusher.pushGenericValue(
            url: url,
            value: name,
            parameters: [:]
        ) { response in
            completion(response)
        }
    }

    func pushCities(
        whereTo url: String,
        names: [String],
        completion: @escaping (Result<Data, CustomError>) -> Void
    ) {
        dataPusher.pushGenericValue(
            url: url,
            value: names,
            parameters: [:]
        ) { response in
            completion(response)
        }
    }
}

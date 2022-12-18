//
//  NetworkDataFetcher.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation

class NetworkDataFetcher: DataFetcherType {

    var networkService: Networkign

    init(networkService: Networkign = NetworkService()) {
        self.networkService = networkService
    }

    func fetchGenericJSONData<T: Decodable>(
        stringUrl: String,
        parameters: Parameters,
        response: @escaping completionHandlerWitchGenericTypeOrNetworkError<T>
    ) {
        networkService.request(
            stringUrl: stringUrl,
            parameters: parameters
        ) { result in
            switch result {
            case .success(let data):
                let decodedData = self.decodeJSON(type: T.self, from: data)
                response(decodedData)
            case .failure(let error):
                response(.failure(error.convertToNetworkError))
            }
        }
    }

    private func decodeJSON<T: Decodable>(
        type: T.Type,
        from: Data?
    ) -> resultWitchGenericTypeOrNetworkError<T> {
        guard let data = from else {
            return .failure(.decodingDataFailed)
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let object = try decoder.decode(type, from: data)

            return .success(object)
        } catch {
            return .failure(.decodingDataFailed)
        }
    }
}



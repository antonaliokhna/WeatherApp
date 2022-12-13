//
//  NetworkDataFetcher.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation

protocol DataFetcher {
    func fetchGenericJSONData<T: Decodable>(stringUrl: String, response: @escaping (Result<T, NetworkError>) -> Void)
}

class NetworkDataFetcher: DataFetcher {

    var networkService: Networkign

    init(networkService: Networkign = NetworkService()) {
        self.networkService = networkService
    }

    func fetchGenericJSONData<T: Decodable>(stringUrl: String, response: @escaping (Result<T, NetworkError>) -> Void) {
        networkService.request(stringUrl: stringUrl) { result in

            switch result {
            case .success(let data):
                let decodedData = self.decodeJSON(type: T.self, from: data)
                print(decodedData)
                response(decodedData)
            case .failure(let error):
                response(.failure(.requestFailed(description: error.localizedDescription)))
            }
        }
    }

    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> Result<T, NetworkError> {
        guard let data = from else {
            return .failure(.invalidDecodingData(description: "Data is empty"))
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let object = try decoder.decode(type, from: data)

            return .success(object)
        } catch(let error) {
            return .failure(.invalidDecodingData(description: error.localizedDescription))
        }
    }
}



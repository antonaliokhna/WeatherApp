//
//  DataFetcher.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation

class DataFetcher: DataFetcherType {
    
    private let service: DataFetcherServiceType

    init(service: DataFetcherServiceType) {
        self.service = service
    }

    func fetchGenericData<T: Decodable>(
        url: String,
        parameters: Parameters,
        response: @escaping ResultWitchGenericDecodableTypeOrCustomErrorReturnVoid<T>
    ) {
        service.fetch(
            from: url,
            parameters: parameters
        ) { result in
            switch result {
            case .success(let data):
                let decodedData = self.decodeData(type: T.self, from: data)
                response(decodedData)
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    private func decodeData<T: Decodable>(
        type: T.Type,
        from: Data?
    ) -> Result<T, CustomError> {
        guard let data = from else {
            return .failure(.codableError(error: .dataIsEmpty))
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let object = try? decoder.decode(type, from: data) else {
            return .failure(.codableError(error: .decodingDataFailed))
        }

        return .success(object)
    }
}



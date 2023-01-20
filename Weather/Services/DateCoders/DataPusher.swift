//
//  DataPusher.swift
//  Weather
//
//  Created by Anton Aliokhna on 1/3/23.
//

import Foundation

class DataPusher {

    private var service: DataPusherServiceType

    init(service: UserDefaultsService = UserDefaultsService()) {
        self.service = service
    }

    func pushGenericValue<T: Encodable>(
        url: String,
        value: T,
        parameters: [String: Any] = [:],
        response: @escaping (Result<Data, CustomError>) -> Void
    ) {
        do {
            let data = try encodeData(from: value)

            service.push(
                whereTo: url,
                data: data,
                parameters: parameters,
                completion: response
            )
        } catch (let error) {
            guard let error = error as? CodableError else {
                response(.failure(.localError(error: .unknownError)))

                return
            }
            response(.failure(.codableError(error: error)))
        }
    }

    private func encodeData<T: Encodable>(from: T) throws -> Data {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(from) else {
            throw CodableError.encodingDataFailed
        }

        return data
    }
}

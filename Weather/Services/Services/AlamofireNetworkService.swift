//
//  AlamofireNetworkService.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation
import Alamofire

class AlamofireNetworkService: Service {

    typealias ServiceType = Session
    let service: ServiceType = {
        let configuration = AF.sessionConfiguration
        configuration.timeoutIntervalForRequest = 5

        return Session(configuration: configuration)
    }()

    func push(
        whereTo url: String,
        data: Data,
        parameters: Parameters,
        completion: @escaping ResultWitchDataOrCustomErrorReturnVoid
    ) {
        print("Push \(data.count) bytes to network...")
    }

    func fetch(
        from url: String,
        parameters: Parameters,
        completion: @escaping ResultWitchOptionalDataOrCustomErrorReturnVoid
    ) {
        guard let url = URL(string: url) else {
            completion(.failure(.networkError(error: .invalidURL)))

            return
        }

        let request = createRequest(
            request: url,
            parameters: parameters,
            completion: completion
        )
        request.resume()
    }

    private func createRequest(
        request: URLConvertible,
        parameters: Parameters,
        completion: @escaping ResultWitchOptionalDataOrCustomErrorReturnVoid
    ) -> DataRequest {
        return service.request(
            request,
            parameters: parameters
        )
        .validate()
        .response { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(
                    .failure(.networkError(error: error.convertToNetworkError))
                )
            }
        }
    }
}

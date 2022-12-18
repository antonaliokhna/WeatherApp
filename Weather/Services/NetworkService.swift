//
//  NetworkService.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation
import Alamofire

class NetworkService: Networkign {
    private let sessionManager: Session = {
        let configuration = AF.sessionConfiguration
        configuration.timeoutIntervalForRequest = 5
        return Session(configuration: configuration)
      }()

    func request(
        stringUrl: String,
        parameters: Parameters,
        completion: @escaping completionHandlerWitchOptionalDataOrAFError
    ) {
        guard let url = URL(string: stringUrl) else {
            completion(.failure(.invalidURL(url: stringUrl)))

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
        completion: @escaping completionHandlerWitchOptionalDataOrAFError
    ) -> DataRequest {
        return sessionManager.request(
            request,
            parameters: parameters
        )
        .validate()
        .response { response in
            completion(response.result)
        }
    }
}

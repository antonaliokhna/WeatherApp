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
        completion: @escaping completionHandlerWitchOptionalDataOrAFError
    ) {
        guard let url = URL(string: stringUrl) else {
            completion(.failure(.invalidURL(url: stringUrl)))

            return
        }
        let request = createRequest(request: url, completion: completion)
        request.resume()
    }

    private func createRequest(
        request: URLConvertible,
        completion: @escaping completionHandlerWitchOptionalDataOrAFError
    ) -> DataRequest {
        return sessionManager.request(request).validate().response { response in
            completion(response.result)
        }
    }
}

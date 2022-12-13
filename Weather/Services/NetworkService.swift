//
//  NetworkService.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation
import Alamofire

protocol Networkign {
    func request(stringUrl: String, completion: @escaping (Result<Data?, AFError>) -> Void)
}

class NetworkService: Networkign {
    func request(stringUrl: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        guard let url = URL(string: stringUrl) else {
            completion(.failure(.invalidURL(url: stringUrl)))

            return
        }

        let request = createRequest(request: url, completion: completion)
        request.resume()
    }

    private func createRequest(request: URLConvertible, completion: @escaping (Result<Data?, AFError>) -> Void) -> DataRequest {
        return AF.request(request).validate().response { response in
            completion(response.result)
        }
    }
}

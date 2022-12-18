//
//  DataFetcherType.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/14/22.
//

import Foundation

protocol DataFetcherType {
    typealias Parameters = [String: Any]

    typealias resultWitchGenericTypeOrNetworkError<T: Decodable> =
        Result<T, NetworkError>

    typealias completionHandlerWitchGenericTypeOrNetworkError<T: Decodable> =
        (resultWitchGenericTypeOrNetworkError<T>) -> Void

    func fetchGenericJSONData<T: Decodable>(
        stringUrl: String,
        parameters: Parameters,
        response: @escaping completionHandlerWitchGenericTypeOrNetworkError<T>
    )
}

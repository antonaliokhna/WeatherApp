//
//  DataFetcherType.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/14/22.
//

import Foundation
import Alamofire

protocol DataFetcherType {
    typealias resultWitchGenericTypeOrNetworkError<T: Decodable> =
        Result<T, NetworkError>

    typealias completionHandlerWitchGenericTypeOrNetworkError<T: Decodable> =
        (resultWitchGenericTypeOrNetworkError<T>) -> Void

    func fetchGenericJSONData<T: Decodable>(
        stringUrl: String,
        response: @escaping completionHandlerWitchGenericTypeOrNetworkError<T>
    )
}

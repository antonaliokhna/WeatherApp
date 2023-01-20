//
//  DataFetcherType.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/14/22.
//

import Foundation

protocol DataFetcherType {
    typealias Parameters = [String: Any]

    typealias resultWitchGenericTypeOrCustomError<T: Decodable> =
        Result<T, CustomError>

    typealias completionHandlerWitchGenericTypeOrCustomError<T: Decodable> =
        (resultWitchGenericTypeOrCustomError<T>) -> Void

    func fetchGenericData<T: Decodable>(
        stringUrl: String,
        parameters: Parameters,
        response: @escaping completionHandlerWitchGenericTypeOrCustomError<T>
    )
}

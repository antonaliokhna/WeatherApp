//
//  DataFetcherType.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/14/22.
//

import Foundation

protocol DataFetcherType {
    typealias Parameters = [String: Any]

    typealias ResultWitchGenericDecodableTypeOrCustomError<T: Decodable> =
        Result<T, CustomError>

    typealias ResultWitchGenericDecodableTypeOrCustomErrorReturnVoid<T: Decodable> =
        (ResultWitchGenericDecodableTypeOrCustomError<T>) -> Void

    func fetchGenericData<T: Decodable>(
        url: String,
        parameters: Parameters,
        response: @escaping ResultWitchGenericDecodableTypeOrCustomErrorReturnVoid<T>
    )
}

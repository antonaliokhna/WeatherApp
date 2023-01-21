//
//  DataPusherType.swift
//  Weather
//
//  Created by Anton Aliokhna on 1/21/23.
//

import Foundation

protocol DataPusherType {
    typealias Parameters = [String: Any]

    typealias ResultWitchDataOrCustomError =
        Result<Data, CustomError>

    typealias ResultWitchDataOrCustomErrorReturnVoid =
        (ResultWitchDataOrCustomError) -> Void

    func pushGenericValue<T: Encodable>(
        url: String,
        value: T,
        parameters: Parameters,
        response: @escaping ResultWitchDataOrCustomErrorReturnVoid
    )
}

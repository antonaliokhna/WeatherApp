//
//  DataFetcherServiceType.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/14/22.
//

import Foundation

protocol DataFetcherServiceType {
    typealias Parameters = [String: Any]
    
    typealias ResultWitchOptionalDataOrCustomError =
        Result<Data?, CustomError>

    typealias ResultWitchOptionalDataOrCustomErrorReturnVoid =
        (ResultWitchOptionalDataOrCustomError) -> Void

    func fetch(
        from url: String,
        parameters: [String: Any],
        completion: @escaping ResultWitchOptionalDataOrCustomErrorReturnVoid
    )
}

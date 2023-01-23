//
//  DataPusherServiceType.swift
//  Weather
//
//  Created by Anton Aliokhna on 1/8/23.
//

import Foundation

protocol DataPusherServiceType {
    typealias Parameters = [String: Any]
    
    typealias ResultWitchDataOrCustomError =
        Result<Data, CustomError>

    typealias ResultWitchDataOrCustomErrorReturnVoid =
        (ResultWitchDataOrCustomError) -> Void
    
    func push(
        whereTo url: String,
        data: Data,
        parameters: Parameters,
        completion: @escaping ResultWitchDataOrCustomErrorReturnVoid
    )
}

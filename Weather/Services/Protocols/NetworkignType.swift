//
//  NetworkignType.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/14/22.
//

import Foundation
import Alamofire

protocol Networkign {
    typealias completionHandlerWitchOptionalDataOrAFError =
        (Result<Data?, AFError>) -> Void

    func request(
        stringUrl: String,
        parameters: Parameters,
        completion: @escaping completionHandlerWitchOptionalDataOrAFError
    )
}

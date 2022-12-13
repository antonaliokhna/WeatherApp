//
//  NetworkError.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case intetnerConnectionFailed(description: String?) //Internet Off
    case requestFailed(description: String?) //404
    case invalidDecodingData(description: String?) // invalid decoding to model
    case invalidURL(description: String?) //invalidURL
    case requestTimeOut(description: String?)


    var errorDescription: String? {
        let error: String?
        switch self {
        case .invalidDecodingData(let description):
            error = description
        case .intetnerConnectionFailed(let description):
            error = description
        case .requestFailed(let description):
            error = description
        case .invalidURL(let description):
            error = description
        case .requestTimeOut(let description):
            error = description
        }
        return error
    }
}

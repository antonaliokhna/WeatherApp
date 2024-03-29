//
//  CustomError.swift
//  Weather
//
//  Created by Anton Aliokhna on 1/20/23.
//

import Foundation

enum CustomError: Error, LocalizedError {
    case networkError(error: NetworkError)
    case localError(error: LocalError)
    case codableError(error: CodableError)

    var errorDescription: String! {
        let description: String
        switch self {
        case .networkError(let error):
            description = error.errorDescription
        case .localError(let error):
            description = error.errorDescription
        case .codableError(let error):
            description = error.errorDescription
        }

        return description
    }
}

//
//  LocalError.swift
//  Weather
//
//  Created by Anton Aliokhna on 1/20/23.
//

import Foundation

enum LocalError: Error, LocalizedError {
    case fetchDataFailed
    case pushDataFailed
    case unknownError

    var errorDescription: String! {
        let description: String
        switch self {
        case .pushDataFailed:
            description = "Local error. Push data failed."
        case .fetchDataFailed:
            description = "Local error. Fetch data failed."
        case .unknownError:
            description = "Unknown error. :("
        }

        return description
    }
}

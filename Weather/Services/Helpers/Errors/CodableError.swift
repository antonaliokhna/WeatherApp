//
//  CodableError.swift
//  Weather
//
//  Created by Anton Aliokhna on 1/20/23.
//

import Foundation

enum CodableError: Error, LocalizedError{
    case decodingDataFailed
    case encodingDataFailed
    case dataIsEmpty

    var errorDescription: String! {
        let description: String
        switch self {
        case .decodingDataFailed:
            description = "Date decoding failed, please contact the developer."
        case .encodingDataFailed:
            description = "Date encoding failed, please contact the developer."
        case .dataIsEmpty:
            description = "Date is empty, please contact the developer."
        }

        return description
    }
}

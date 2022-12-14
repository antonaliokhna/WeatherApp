//
//  NetworkError.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case internetConnectionFailed
    case requestFailed(statusCode: Int?)
    case decodingDataFailed
    case requestTimeOut
    case invalidURL

    var errorDescription: String? {
        let description: String?
        switch self {
        case .requestFailed(let statusCode):
            description = "Request execution error \(statusCode ?? 404)."
        case .decodingDataFailed:
            description = "Invalid decoding data. Please contact the developer."
        case .invalidURL:
            description = "Error when trying to execute a link request. Please contact the developer."
        case .requestTimeOut:
            description = "The request has exceeded the time allowed, please try again later."
        case .internetConnectionFailed:
            description = "There is no internet connection. Please check the connection and restart the application."
        }

        return description
    }
}

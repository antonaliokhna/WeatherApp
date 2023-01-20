//
//  NetworkError.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/13/22.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case requestFailed(statusCode: Int?)
    case internetConnectionFailed
    case requestTimeOut
    case invalidURL

    var errorDescription: String! {
        let description: String
        switch self {
        case .requestFailed(let statusCode):
            description = "Request execution error \(statusCode ?? 418)."
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

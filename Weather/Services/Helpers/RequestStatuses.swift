//
//  RequestStatuses.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/15/22.
//

import Foundation

enum RequestStatuses: LocalizedError {
    case failed(status: CustomError)
    case sucsess
    case loading
}

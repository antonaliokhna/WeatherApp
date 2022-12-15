//
//  NetworkStatus.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/15/22.
//

import Foundation

enum NetworkStatuses {
    case failed(status: NetworkError)
    case sucsess
    case loading
}

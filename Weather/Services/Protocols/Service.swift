//
//  Service.swift
//  Weather
//
//  Created by Anton Aliokhna on 1/22/23.
//

import Foundation

protocol Service: DataFetcherServiceType, DataPusherServiceType {
    associatedtype ServiceType
    var service: ServiceType { get }
}

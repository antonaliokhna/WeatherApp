//
//  UserDefaultsService.swift
//  Weather
//
//  Created by Anton Aliokhna on 1/2/23.
//

import Foundation

class UserDefaultsService: Service {
    typealias ServiceType = UserDefaults
    let service: ServiceType = UserDefaults.standard

    func push(
        whereTo url: String,
        data: Data,
        parameters: Parameters,
        completion: @escaping ResultWitchDataOrCustomErrorReturnVoid
    ) {
        service.set(data, forKey: url)
        completion(.success(data))
    }

    func fetch(
        from url: String,
        parameters: Parameters,
        completion: @escaping ResultWitchOptionalDataOrCustomErrorReturnVoid
    ) {
        let data = service.data(forKey: url)
        completion(.success(data))
    }

}

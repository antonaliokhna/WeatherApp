//
//  UserDefaultsService.swift
//  Weather
//
//  Created by Anton Aliokhna on 1/2/23.
//

import Foundation

class UserDefaultsService: DataFetcherServiceType, DataPusherServiceType {
    
    private let userDefaults = UserDefaults.standard

    func push(
        whereTo url: String,
        data: Data,
        parameters: [String : Any],
        completion: @escaping ResultWitchDataOrCustomErrorReturnVoid
    ) {
        userDefaults.set(data, forKey: url)
        completion(.success(data))
    }

    func fetch(
        from url: String,
        parameters: [String: Any],
        completion: @escaping ResultWitchOptionalDataOrCustomErrorReturnVoid
    ) {
        let data = userDefaults.data(forKey: url)
        completion(.success(data))
    }

}

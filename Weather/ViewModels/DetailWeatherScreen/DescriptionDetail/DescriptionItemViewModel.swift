//
//  DescriptionItemViewModel.swift
//  Weather
//
//  Created by Anton Aliokhna on 12/18/22.
//

import Foundation

class DescriptionItemViewModel: ObservableObject {
    var textLabel: String
    var imageLabel: String
    var value: String
    var description: String

    init(textLabel: String, imageLabel: String, value: String, description: String) {
        self.textLabel = textLabel
        self.imageLabel = imageLabel
        self.value = value
        self.description = description
    }
}

//MARK: - Hashable
extension DescriptionItemViewModel: Hashable {
    var identifier: String {
        return UUID().uuidString
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }

    static func == (
        lhs: DescriptionItemViewModel,
        rhs: DescriptionItemViewModel
    ) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

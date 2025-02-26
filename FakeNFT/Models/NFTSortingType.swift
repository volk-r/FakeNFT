//
//  NFTSortingType.swift
//  FakeNFT
//
//  Created by Roman Romanov on 23.02.2025.
//

import Foundation

enum NFTSortingType: Codable {
    case byPrice
    case byRating
    case byName
    
    static let description: String = String(localized: "Sorting")
    
    var title: String {
        switch self {
        case .byPrice:
            return String(localized: "By price")
        case .byRating:
            return String(localized: "By rating")
        case .byName:
            return  String(localized: "By name")
        }
    }
}

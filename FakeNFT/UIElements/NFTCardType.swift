//
//  NFTCardType.swift
//  FakeNFT
//
//  Created by Roman Romanov on 22.02.2025.
//

import Foundation

enum NFTCardType: CaseIterable {
    case mini
    case normal
    case flexible
    
    var cardSize: CGFloat? {
        switch self {
        case .mini: 80
        case .normal: 108
        case .flexible: nil
        }
    }
    
    var likeWidth: CGFloat {
        switch self {
        case .mini: 21
        case .normal, .flexible: 17.64
        }
    }
    
    var likeHeight: CGFloat {
        switch self {
        case .mini: 18
        case .normal, .flexible: 15.75
        }
    }
    
    var likeTrailingPadding: CGFloat {
        switch self {
        case .mini: 4.81
        case .normal, .flexible: 11.36
        }
    }
    
    var likeTopPadding: CGFloat {
        switch self {
        case .mini: 5.81
        case .normal, .flexible: 12
        }
    }
}

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
    
    var cardSize: CGFloat {
        switch self {
        case .mini: 80
        case .normal: 108
        }
    }
    
    var likeWidth: CGFloat {
        switch self {
        case .mini: 21
        case .normal: 17.64
        }
    }
    
    var likeHeight: CGFloat {
        switch self {
        case .mini: 18
        case .normal: 15.75
        }
    }
    
    var likeTrailingPadding: CGFloat {
        switch self {
        case .mini: 4.81
        case .normal: 11.36
        }
    }
    
    var likeTopPadding: CGFloat {
        switch self {
        case .mini: 5.81
        case .normal: 12
        }
    }
}

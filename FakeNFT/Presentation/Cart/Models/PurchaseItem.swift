//
//  PurchaseItem.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/25/25.
//

import Foundation

struct PurchaseItem: Identifiable {
    let id = UUID()
    let imageUrl: String
    let name: String
    let ticker: String
    
    static let mockItem = PurchaseItem(
        imageUrl: GlobalConstants.mockPreviewImageUrl,
        name: "Bitcoin",
        ticker: "BTC"
    )
    
    static let mockItems = Array(repeating: Self.mockItem, count: 10)
}

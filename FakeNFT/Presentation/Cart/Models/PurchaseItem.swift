//
//  PurchaseItem.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/25/25.
//

import Foundation

struct PurchaseItem: Identifiable, Equatable {
    let id = UUID()
    let imageUrl: String
    let name: String
    let ticker: String
    
    static let mockItem = PurchaseItem(
        imageUrl: GlobalConstants.mockPreviewImageUrl,
        name: "Bitcoin",
        ticker: "BTC"
    )
    
    static let mockItems = [
        PurchaseItem(
            imageUrl: GlobalConstants.mockPreviewImageUrl,
            name: "Bitcoin",
            ticker: "BTC"
        ),
        PurchaseItem(
            imageUrl: GlobalConstants.mockPreviewImageUrl,
            name: "Bitcoin",
            ticker: "BTC"
        ),
        PurchaseItem(
            imageUrl: GlobalConstants.mockPreviewImageUrl,
            name: "Bitcoin",
            ticker: "BTC"
        ),
        PurchaseItem(
            imageUrl: GlobalConstants.mockPreviewImageUrl,
            name: "Bitcoin",
            ticker: "BTC"
        ),
        PurchaseItem(
            imageUrl: GlobalConstants.mockPreviewImageUrl,
            name: "Bitcoin",
            ticker: "BTC"
        ),
        PurchaseItem(
            imageUrl: GlobalConstants.mockPreviewImageUrl,
            name: "Bitcoin",
            ticker: "BTC"
        )
    ]
}

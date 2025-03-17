//
//  PurchaseItem.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/25/25.
//

import Foundation

struct PurchaseItem: Identifiable, Equatable {
    let id: String
    let imageUrl: String
    let name: String
    let ticker: String
    
    static let mockItem = PurchaseItem(
        id: UUID().uuidString,
        imageUrl: GlobalConstants.mockPreviewImageUrl,
        name: "Bitcoin",
        ticker: "BTC"
    )
    
    static let mockItems = [
        PurchaseItem(
            id: UUID().uuidString,
            imageUrl: GlobalConstants.mockPreviewImageUrl,
            name: "Bitcoin",
            ticker: "BTC"
        ),
        PurchaseItem(
            id: UUID().uuidString,
            imageUrl: GlobalConstants.mockPreviewImageUrl,
            name: "Bitcoin",
            ticker: "BTC"
        ),
        PurchaseItem(
            id: UUID().uuidString,
            imageUrl: GlobalConstants.mockPreviewImageUrl,
            name: "Bitcoin",
            ticker: "BTC"
        ),
        PurchaseItem(
            id: UUID().uuidString,
            imageUrl: GlobalConstants.mockPreviewImageUrl,
            name: "Bitcoin",
            ticker: "BTC"
        ),
        PurchaseItem(
            id: UUID().uuidString,
            imageUrl: GlobalConstants.mockPreviewImageUrl,
            name: "Bitcoin",
            ticker: "BTC"
        ),
        PurchaseItem(
            id: UUID().uuidString,
            imageUrl: GlobalConstants.mockPreviewImageUrl,
            name: "Bitcoin",
            ticker: "BTC"
        )
    ]
}

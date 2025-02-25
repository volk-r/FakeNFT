//
//  CartItem.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/25/25.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let imageUrl: String
    let name: String
    let rating: Int
    let price: Double
    
    static let mockItem = CartItem(
        imageUrl: GlobalConstants.mockPreviewImageUrl,
        name: "Lilo",
        rating: 3,
        price: 1.78
    )
    
    static let mockItems: [CartItem] = Array(repeating: Self.mockItem, count: 10)
}

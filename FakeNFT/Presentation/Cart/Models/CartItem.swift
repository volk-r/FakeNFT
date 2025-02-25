//
//  CartItem.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/25/25.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let name: String
    let rating: Double
    let from: String
    let price: Double
}

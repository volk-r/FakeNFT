//
//  CartToolbarItem.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/27/25.
//

struct CartToolbarItem {
    let count: Int
    let price: Double
}

extension CartToolbarItem {
    static let empty = CartToolbarItem(count: 0, price: 0)
}

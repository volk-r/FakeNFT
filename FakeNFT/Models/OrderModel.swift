//
//  OrderModel.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 09.03.2025.
//

import Foundation

struct OrderModel: Codable, Sendable, Equatable {
    let id: String
    let nfts: [String]
}

extension OrderModel {
    static var mockOrder: OrderModel {
        OrderModel(
            id: "96f8614c-daad-49b2-b8b4-0abc91db847f",
            nfts: [NFTModel.mock1.id]
        )
    }
}

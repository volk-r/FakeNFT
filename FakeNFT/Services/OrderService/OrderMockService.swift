//
//  OrderMockService.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 09.03.2025.
//

import Foundation

actor OrderMockService: OrderServiceProtocol {
    private var order = OrderModel.mockOrder
    
    func loadOrder(for orderId: String) async throws -> OrderModel? {
        return order
    }
    
    func updateOrder(for orderId: String, with nfts: [String]) async throws -> OrderModel? {
        order = OrderModel(id: order.id, nfts: nfts)
        return order
    }
}

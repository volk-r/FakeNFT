//
//  OrderManager.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 09.03.2025.
//

import Foundation
import Observation

@Observable
final class OrderManager: OrderManagerProtocol {
    private let orderService: OrderServiceProtocol
    private(set) var order: OrderModel?
    private var isOrderUpdateInProcess = false
    private let orderId = "1"
    
    init(orderService: OrderServiceProtocol = OrderService()) {
        self.orderService = orderService
    }
    
    func loadOrder() async throws {
        let loadedOrder = try await orderService.loadOrder(for: orderId)
        self.order = loadedOrder
    }
    
    func toggleNFT(_ nftId: String) async throws {
        guard let order = order, !isOrderUpdateInProcess else { return }
        
        isOrderUpdateInProcess = true
        
        defer { isOrderUpdateInProcess = false }
        
        let newNfts = order.nfts.contains(nftId)
            ? order.nfts.filter { $0 != nftId }
            : order.nfts + [nftId]
        let updatedOrder = try await orderService.updateOrder(for: orderId, with: newNfts)
        self.order = updatedOrder
    }
    
    func isNFTInOrder(_ nftId: String) -> Bool {
        order?.nfts.contains(nftId) ?? false
    }
    
    var orderUpdateDisabled: Bool {
        isOrderUpdateInProcess || order == nil
    }
}

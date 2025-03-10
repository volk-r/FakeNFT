//
//  OrderServiceProtocol.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 09.03.2025.
//

import Foundation

protocol OrderServiceProtocol: Sendable {
    func loadOrder(for orderId: String) async throws -> OrderModel?
    func updateOrder(for orderId: String, with nfts: [String]) async throws -> OrderModel?
}

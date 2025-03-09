//
//  OrderManagerProtocol.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 09.03.2025.
//

import Foundation

@MainActor
protocol OrderManagerProtocol: ObservableObject {
    var order: OrderModel? { get }
    var orderUpdateDisabled: Bool { get }
    func loadOrder() async throws
    func toggleNFT(_ nftId: String) async throws
    func isNFTInOrder(_ nftId: String) -> Bool
}

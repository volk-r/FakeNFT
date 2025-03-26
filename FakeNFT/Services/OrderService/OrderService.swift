//
//  OrderService.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 09.03.2025.
//

import Foundation

actor OrderService: OrderServiceProtocol {
    private let networkService: NetworkServiceProtocol
    private var ongoingLoads: [String: Task<OrderModel?, Error>] = [:]
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func loadOrder(for orderId: String) async throws -> OrderModel? {
        if let task = ongoingLoads[orderId] {
            return try await task.value
        }
        let task = Task<OrderModel?, Error> {
            let request = OrderRequest(orderId: orderId)
            return try await networkService.send(request: request)
        }
        
        ongoingLoads[orderId] = task
        
        do {
            let order = try await task.value
            ongoingLoads.removeValue(forKey: orderId)
            return order
        } catch {
            ongoingLoads.removeValue(forKey: orderId)
            throw error
        }
    }
    
    func loadCurrencies() async throws -> [CurrencyModel]? {
        let request = CurrenciesRequest()
        
        return try await networkService.send(request: request)
    }
    
    func setCurrencyBeforePayment(for orderId: String, with currencyId: String) async throws {
        let request = SetCurrencyBeforePaymentRequest(orderId: orderId, currencyId: currencyId)
        
        let _: SetCurrencyBeforePaymentResponse? = try await networkService.send(request: request)
    }
    
    func updateOrder(for orderId: String, with nfts: [String]) async throws -> OrderModel? {
        let request = OrderUpdateRequest(orderId: orderId, nfts: nfts)
        return try await networkService.send(request: request)
    }
}

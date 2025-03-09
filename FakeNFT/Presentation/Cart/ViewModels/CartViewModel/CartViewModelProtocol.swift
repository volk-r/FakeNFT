//
//  CartViewModelProtocol.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/2/25.
//

import Foundation

@MainActor
protocol CartViewModelProtocol: ObservableObject, Sendable {
    var loadingState: LoadingState { get }
    var cartItems: [CartItem] { get }
    var isEmptyCart: Bool { get }
    var cartToolbarItem: CartToolbarItem { get }
    
    func getCart() async
    func refreshCart() async
    
    func sortButtonTapped()
    func deleteCartItemButtonTapped(_ cartItem: CartItem)
    func forPaymentButtonTapped()
}

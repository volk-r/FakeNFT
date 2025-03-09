//
//  CartViewModel.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/2/25.
//

import SwiftUICore

@Observable
final class CartViewModel: CartViewModelProtocol {
    var cartItems: [CartItem] = []
    var loadingState: LoadingState = .default
    var cartToolbarItem: CartToolbarItem = .empty
    var isEmptyCart: Bool { cartItems.isEmpty }
    
    private let navigationPath: Binding<[CartNavigationPath]>
    
    init(navigationPath: Binding<[CartNavigationPath]>) {
        self.navigationPath = navigationPath
    }
    
    func getCart() async {
        guard loadingState == .default else { return }
        
        loadingState = .loading
        
        do {
            try await fetchCart()
        } catch is CancellationError {
            loadingState = .default
        } catch {
            loadingState = .failure
        }
    }
    
    func refreshCart() async {
        try? await fetchCart()
    }
    
    func sortButtonTapped() {
        
    }
    
    func deleteCartItemButtonTapped(_ cartItem: CartItem) {
        
    }
    
    func forPaymentButtonTapped() {
        navigationPath.wrappedValue.append(.purchase)
    }
}

private extension CartViewModel {
    func fetchCart() async throws {
        try await Task.sleep(for: .seconds(1))
        
        loadingState = .success
        setCartItems(CartItem.mockItems)
    }
    
    func setCartItems(_ cartItems: [CartItem]) {
        self.cartItems = cartItems
        self.cartToolbarItem = getCartToolbarItem(for: cartItems)
    }
    
    func getCartToolbarItem(for cartItems: [CartItem]) -> CartToolbarItem {
        .init(
            count: cartItems.count,
            price: cartItems.reduce(0) { result, item in
                result + item.price
            }
        )
    }
}

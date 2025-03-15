//
//  CartViewModel.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/2/25.
//

import Foundation

@Observable
final class CartViewModel: CartViewModelProtocol {
    var cartItems: [CartItem] = []
    var loadingState: LoadingState = .default
    var cartToolbarItem: CartToolbarItem = .empty
    var isEmptyCart: Bool { cartItems.isEmpty }
    var isPresentedSortDialog: Bool = false
    var sortType: NFTSortingType?
    var isPresentedConfirmDelete: Bool = false
    var isDeleteItemLoading: Bool = false
    
    private var deletingCartItem: CartItem?
    private let orderManager: any OrderManagerProtocol
    private let nftDetailsService: NFTDetailsServiceProtocol
    private let navigateTo: (CartNavigationPath) -> Void
    
    init(
        orderManager: any OrderManagerProtocol,
        nftDetailsService: NFTDetailsServiceProtocol,
        navigateTo: @escaping (CartNavigationPath) -> Void
    ) {
        self.orderManager = orderManager
        self.nftDetailsService = nftDetailsService
        self.navigateTo = navigateTo
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
    
    func onAppear() {
        guard
            loadingState != .default,
            loadingState != .loading
        else { return }
        
        Task {
            loadingState = .loading
            
            do {
                try await setCartItems(orderManager.order?.nfts ?? [])
            } catch is CancellationError {
                loadingState = .default
            } catch {
                loadingState = .failure
            }
        }
    }
    
    func sortButtonTapped() {
        isPresentedSortDialog = true
    }
    
    func setSort(_ sortType: NFTSortingType) {
        self.sortType = sortType
        self.cartItems = sortCartItems(cartItems, at: sortType)
    }
    
    func deleteCartItemButtonTapped(_ cartItem: CartItem) {
        self.deletingCartItem = cartItem
        isPresentedConfirmDelete = true
    }
    
    func forPaymentButtonTapped() {
        navigateTo(.purchase)
    }
    
    func deleteConfirmTapped() {
        isDeleteItemLoading = true
        
        Task {
            try? await deleteItem()
            
            deletingCartItem = nil
            isPresentedConfirmDelete = false
            isDeleteItemLoading = false
        }
    }
    
    func cancelDeleteConfirmTapped() {
        deletingCartItem = nil
        isPresentedConfirmDelete = false
    }
}

private extension CartViewModel {
    func fetchCart() async throws {
        try await orderManager.loadOrder()
        
        try await setCartItems(orderManager.order?.nfts ?? [])
    }
    
    func deleteItem() async throws {
        guard let deletingCartItem else { return }
        
        try await orderManager.toggleNFT(deletingCartItem.id)
        
        try await setCartItems(orderManager.order?.nfts ?? [])
    }
    
    func setCartItems(_ nfts: [String]) async throws {
        let nftItems = try await nftDetailsService.loadNFT(for: nfts)
        
        let cartItems = sortCartItems(nftItems.map {
            .init(
                id: $0.id,
                imageUrl: $0.images.first ?? "",
                name: $0.name,
                rating: $0.rating,
                price: $0.price
            )
        }, at: sortType)
        
        loadingState = .success
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
    
    func sortCartItems(_ cartItems: [CartItem], at sortType: NFTSortingType?) -> [CartItem] {
        switch sortType {
        case .byPrice:
            return cartItems.sorted { $0.price < $1.price }
        case .byRating:
            return cartItems.sorted { $0.rating > $1.rating }
        case .byName:
            return cartItems.sorted { $0.name < $1.name }
        default:
            return cartItems
        }
    }
}

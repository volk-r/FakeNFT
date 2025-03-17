//
//  PurchaseViewModel.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/2/25.
//

import Foundation

@Observable
final class PurchaseViewModel: PurchaseViewModelProtocol {
    var loadingState: LoadingState = .default
    var purchaseItems: [PurchaseItem] = []
    var selectedPurchaseItem: PurchaseItem?
    var isPresentedErrorAlert: Bool = false
    var isPayLoading: Bool = false
    
    private let orderManager: any OrderManagerProtocol
    private let navigateTo: (CartNavigationPath) -> Void
    
    init(
        orderManager: any OrderManagerProtocol,
        navigateTo: @escaping (CartNavigationPath) -> Void
    ) {
        self.orderManager = orderManager
        self.navigateTo = navigateTo
    }
    
    var isEmptyPurchase: Bool {
        purchaseItems.isEmpty
    }
    
    func getPurchase() async {
        guard loadingState == .default else { return }
        
        loadingState = .loading
        
        do {
            try await fetchPurchase()
        } catch is CancellationError {
            loadingState = .default
        } catch {
            loadingState = .failure
        }
    }
    
    func purchaseItemTapped(_ item: PurchaseItem) {
        self.selectedPurchaseItem = item
    }
    
    func userAgreementTapped() {
        navigateTo(.userAgreement)
    }
    
    func payButtonTapped() {
        if let selectedPurchaseItem {
            Task {
                defer {
                    isPayLoading = false
                }
                
                do {
                    isPayLoading = true
                    try await orderManager.payOrder(currencyId: selectedPurchaseItem.id)
                    
                    navigateTo(.purchaseSuccess)
                } catch {
                    isPresentedErrorAlert = true
                }
            }
        } else {
            isPresentedErrorAlert = true
        }
    }
}

private extension PurchaseViewModel {
    func fetchPurchase() async throws {
        let currencies = try await orderManager.loadCurrencies()
        
        loadingState = .success
        setPurchaseItems(currencies.map {
            .init(
                id: $0.id,
                imageUrl: $0.image,
                name: $0.title,
                ticker: $0.name
            )
        })
    }
    
    func setPurchaseItems(_ purchaseItems: [PurchaseItem]) {
        self.purchaseItems = purchaseItems
    }
}

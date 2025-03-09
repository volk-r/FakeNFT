//
//  PurchaseViewModel.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/2/25.
//

import SwiftUICore

@Observable
final class PurchaseViewModel: PurchaseViewModelProtocol {
    var loadingState: LoadingState = .default
    var purchaseItems: [PurchaseItem] = []
    var selectedPurchaseItem: PurchaseItem?
    
    private let navigationPath: Binding<[CartNavigationPath]>
    
    init(navigationPath: Binding<[CartNavigationPath]>) {
        self.navigationPath = navigationPath
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
        navigationPath.wrappedValue.append(.userAgreement)
    }
    
    func payButtonTapped() {
        navigationPath.wrappedValue.append(.purchaseSuccess)
    }
}

private extension PurchaseViewModel {
    func fetchPurchase() async throws {
        try await Task.sleep(for: .seconds(1))
        
        loadingState = .success
        setPurchaseItems(PurchaseItem.mockItems)
    }
    
    func setPurchaseItems(_ purchaseItems: [PurchaseItem]) {
        self.purchaseItems = purchaseItems
    }
}

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
    
    private let navigateTo: (CartNavigationPath) -> Void
    
    init(navigateTo: @escaping (CartNavigationPath) -> Void) {
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
        if selectedPurchaseItem == nil {
            isPresentedErrorAlert = true
        } else {
            navigateTo(.purchaseSuccess)
        }
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

//
//  PurchaseSuccessViewModel.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/9/25.
//

final class PurchaseSuccessViewModel: PurchaseSuccessViewModelProtocol {
    private let returnToCatalog: () -> Void
    
    init(returnToCatalog: @escaping () -> Void) {
        self.returnToCatalog = returnToCatalog
    }
    
    func returnToCatalogButtonTapped() {
        returnToCatalog()
    }
}

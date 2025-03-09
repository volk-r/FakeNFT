//
//  PurchaseSuccessViewModel.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/9/25.
//

import SwiftUICore

final class PurchaseSuccessViewModel: PurchaseSuccessViewModelProtocol {
    private let navigationPath: Binding<[CartNavigationPath]>
    
    init(navigationPath: Binding<[CartNavigationPath]>) {
        self.navigationPath = navigationPath
    }
    
    func returnToCatalogButtonTapped() {
        navigationPath.wrappedValue.removeAll()
    }
}

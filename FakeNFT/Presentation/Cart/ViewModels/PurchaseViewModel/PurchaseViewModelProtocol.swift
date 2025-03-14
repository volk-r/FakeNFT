//
//  PurchaseViewModelProtocol.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/2/25.
//

import Foundation

@MainActor
protocol PurchaseViewModelProtocol: ObservableObject, Sendable {
    var loadingState: LoadingState { get }
    var purchaseItems: [PurchaseItem] { get }
    var selectedPurchaseItem: PurchaseItem? { get }
    var isEmptyPurchase: Bool { get }
    var isPresentedErrorAlert: Bool { get set }
    
    func getPurchase() async
    
    func purchaseItemTapped(_ item: PurchaseItem)
    func userAgreementTapped()
    func payButtonTapped()
}

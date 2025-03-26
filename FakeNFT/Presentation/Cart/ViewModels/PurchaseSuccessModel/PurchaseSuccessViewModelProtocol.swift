//
//  PurchaseSuccessViewModelProtocol.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/9/25.
//

import Foundation

@MainActor
protocol PurchaseSuccessViewModelProtocol: ObservableObject, Sendable {
    func returnToCatalogButtonTapped()
}

//
//  CatalogViewModelProtocol.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 24.02.2025.
//

import Foundation

@MainActor
protocol CatalogViewModelProtocol: ObservableObject {
    var collections: [NFTCollection] { get }
    var loadingState: LoadingState { get }
    var sortOrder: CatalogViewModel.SortOrder { get set }
    var sortedCollections: [NFTCollection] { get }

    func loadCollections() async
}

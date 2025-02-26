//
//  CatalogViewModel.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 23.02.2025.
//

import SwiftUI

@Observable
@MainActor
final class CatalogViewModel: CatalogViewModelProtocol {
    // MARK: - Stored Properties
    
    @ObservationIgnored
    @AppStorage("collectionsSortOrder") private var storedSortOrder: String = SortOrder.nftCount.rawValue
    
    // MARK: - Published Properties
    
    var collections: [NFTCollection] = []
    var loadingState: LoadingState = .default
    
    // MARK: - Computed Properties
    
    var sortOrder: SortOrder {
        get { SortOrder(rawValue: storedSortOrder) ?? .nftCount }
        set { storedSortOrder = newValue.rawValue }
    }
    
    var sortedCollections: [NFTCollection] {
        switch sortOrder {
        case .name:
            return collections.sorted {
                $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending
            }
        case .nftCount:
            return collections.sorted {
                $0.nfts.count < $1.nfts.count
            }
        }
    }
    
    // MARK: - Private Properties
    
    nonisolated private let networkService: NFTCollectionsServiceProtocol
    
    // MARK: - Initialization
    
    init(networkService: NFTCollectionsServiceProtocol) {
        self.networkService = networkService
    }
    
    // MARK: - Methods
    
    func loadCollections() async {
        loadingState = .loading
        
        do {
            collections = try await networkService.loadCollections()
            loadingState = .success
        } catch {
            loadingState = .failure
            print("Error loading collections: \(error)")
        }
    }
    
    // MARK: - Nested Types
    
    enum SortOrder: String {
        case name
        case nftCount
    }
}

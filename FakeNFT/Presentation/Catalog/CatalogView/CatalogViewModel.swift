//
//  CatalogViewModel.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 23.02.2025.
//

import SwiftUI

@Observable
@MainActor
final class CatalogViewModel: ObservableObject {
    var collections: [NFTCollection] = []
    var loadingState: LoadingState = .default
    
    nonisolated private let networkService: NFTCollectionsServiceProtocol
    
    init(networkService: NFTCollectionsServiceProtocol) {
        self.networkService = networkService
    }
    
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
}

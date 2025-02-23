//
//  CatalogViewModel.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 23.02.2025.
//

import SwiftUI

@MainActor
final class CatalogViewModel: ObservableObject {
    @Published var collections: [NFTCollection] = []
    
    nonisolated let networkService: NFTCollectionsServiceProtocol
    
    init(networkService: NFTCollectionsServiceProtocol) {
        self.networkService = networkService
    }
    
    func loadCollections() {
        Task {
            do {
                let collections = try await networkService.loadCollections()
                self.collections = collections
            } catch {
                print("Error loading collections: \(error)")
            }
        }
    }
}

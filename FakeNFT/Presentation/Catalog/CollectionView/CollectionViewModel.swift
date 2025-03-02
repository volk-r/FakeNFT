//
//  CollectionViewModel.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 28.02.2025.
//

import SwiftUI

@Observable
@MainActor
final class CollectionViewModel: ObservableObject {
    let collection: NFTCollection
    var nftModels: [NFTModel] = []
    
    private let nftDetailsService: NFTDetailsServiceProtocol
    
    init(collection: NFTCollection,
         nftDetailsService: NFTDetailsServiceProtocol = NFTDetailsService()) {
        self.collection = collection
        self.nftDetailsService = nftDetailsService
    }
    
    func loadNFT() async {
        do {
            nftModels = try await nftDetailsService.loadNFT(for: collection.nfts)
        } catch {
            print("Error loading NFTs: \(error)")
        }
    }
}

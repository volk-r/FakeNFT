//
//  CollectionViewModel.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 28.02.2025.
//

import SwiftUI

@Observable
@MainActor
final class CollectionViewModel: CollectionViewModelProtocol {
    let collection: NFTCollection
    let authorLink = URL(string: "https://practicum.yandex.ru/ios-developer/")
    var nftModels: [NFTModel] = []
    var loadingState: LoadingState = .default
    
    private let nftDetailsService: NFTDetailsServiceProtocol
    
    init(collection: NFTCollection,
         nftDetailsService: NFTDetailsServiceProtocol = NFTDetailsService()) {
        self.collection = collection
        self.nftDetailsService = nftDetailsService
    }
    
    func loadNFT() async {
        loadingState = .loading
        
        do {
            nftModels = try await nftDetailsService.loadNFT(for: collection.nfts)
            nftModels.sort { $0.name < $1.name }
            loadingState = .success
        } catch {
            loadingState = .failure
            print("Error loading NFTs: \(error)")
        }
    }
}

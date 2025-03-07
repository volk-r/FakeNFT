//
//  UsersCollectionViewModel.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 05.03.2025.
//

import SwiftUI

@Observable
@MainActor
final class UsersCollectionViewModel: UsersCollectionViewModelProtocol {
    // MARK: - Public Properties

    var loadingState: LoadingState = .default {
        didSet {
            if loadingState == .failure {
                showingErrorAlert = true
            }
        }
    }
    var nftModels: [NFTModel] = []
    var showingErrorAlert: Bool = false

    // MARK: - Private Properties

    private let loadingService: UsersNFTCollectionServiceProtocol

    // MARK: - Initializers

    init(loadingService: UsersNFTCollectionServiceProtocol = UsersNFTCollectionService()) {
        self.loadingService = loadingService
    }

    // MARK: - Public Methods

    func loadData(withNFTs nfts: [String]) async {
        do {
            guard loadingState != .loading else { return }
            await loadingService.cancelLoad()
            loadingState = .loading

            nftModels = nfts.map { NFTModel.placeholder(id: $0) }

            try await loadingService.getUsersNFTCollection(for: nfts) { nft in
                withAnimation {
                    if let index = self.nftModels.firstIndex(where: { $0.id == nft.id }) {
                        self.nftModels[index] = nft
                    } else {
                        self.nftModels.append(nft)
                    }
                }
            }

            loadingState = .success
        } catch {
            loadingState = .failure
        }
    }
}

//
//  FavoriteNFTsViewModelProtocol.swift
//  FakeNFT
//
//  Created by Roman Romanov on 26.02.2025.
//

import Foundation

@MainActor
protocol FavoriteNFTsViewModelProtocol: Sendable {
    var favoriteNFTsData: [NFTModel] { get }
    var loadingState: LoadingState { get }
    var isEmptyNFTs: Bool { get }
    func updateFavoriteNFTsData(likeIDs: [String])
    func fetchNFTData(likeIDs: [String]) async
    func fetchMockNFTData() async
}

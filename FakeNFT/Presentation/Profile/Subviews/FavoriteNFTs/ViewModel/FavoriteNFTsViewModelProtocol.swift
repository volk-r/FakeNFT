//
//  FavoriteNFTsViewModelProtocol.swift
//  FakeNFT
//
//  Created by Roman Romanov on 26.02.2025.
//

import Foundation

protocol FavoriteNFTsViewModelProtocol: Sendable {
    var favoriteNFTsData: [NFTModel] { get }
    var loadingState: LoadingState { get }
    @MainActor
    func fetchNFTData(likeIDs: [String]?) async
    @MainActor
    func fetchMockNFTData() async
}

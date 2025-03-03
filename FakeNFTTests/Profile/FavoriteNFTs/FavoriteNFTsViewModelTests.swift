//
//  FavoriteNFTsViewModelTests.swift
//  FakeNFTTests
//
//  Created by Roman Romanov on 02.03.2025.
//

import Foundation

import Testing
@testable import FakeNFT

struct FavoriteNFTsViewModelTests {
    @MainActor @Test func testInitState() async throws {
        let viewModel = FavoriteNFTsViewModel()
        
        #expect(viewModel.loadingState == .default)
        #expect(viewModel.isEmptyNFTs == true)
        #expect(viewModel.favoriteNFTsData == [])
    }
    
    @MainActor @Test func testLoadData() async throws {
        let viewModel = FavoriteNFTsViewModel(nftDetailsService: NFTDetailsServiceMock())
        let expectedFavoriteNFTsData: [NFTModel] = [NFTModel.mock1, NFTModel.mock2]
        await viewModel.fetchNFTData(likeIDs: [])

        #expect(viewModel.favoriteNFTsData == expectedFavoriteNFTsData)
    }
}

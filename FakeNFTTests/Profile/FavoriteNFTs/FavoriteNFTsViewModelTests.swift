//
//  FavoriteNFTsViewModelTests.swift
//  FakeNFTTests
//
//  Created by Roman Romanov on 02.03.2025.
//

import Testing
@testable import FakeNFT

struct FavoriteNFTsViewModelTests {
    @MainActor @Test func testInitState() async throws {
        let viewModel: FavoriteNFTsViewModelProtocol = FavoriteNFTsViewModel()
        
        #expect(viewModel.loadingState == .default)
        #expect(viewModel.isEmptyNFTs)
        #expect(viewModel.favoriteNFTsData.isEmpty)
    }
    
    @MainActor @Test func testLoadData() async throws {
        let viewModel: FavoriteNFTsViewModelProtocol = FavoriteNFTsViewModel(nftDetailsService: NFTDetailsServiceMock())
        let expectedFavoriteNFTsData: [NFTModel] = [NFTModel.mock1, NFTModel.mock2]
        await viewModel.fetchNFTData(likeIDs: [NFTModel.mock1.id, NFTModel.mock2.id])

        #expect(viewModel.favoriteNFTsData == expectedFavoriteNFTsData)
    }
    
    @MainActor @Test func testDislike() async throws {
        let viewModel: FavoriteNFTsViewModelProtocol = FavoriteNFTsViewModel(nftDetailsService: NFTDetailsServiceMock())
        let expectedFavoriteNFTsData: [NFTModel] = [NFTModel.mock1, NFTModel.mock2]
        await viewModel.fetchNFTData(likeIDs: [NFTModel.mock1.id, NFTModel.mock2.id])

        #expect(viewModel.favoriteNFTsData == expectedFavoriteNFTsData)
        
        viewModel.updateFavoriteNFTsData(likeIDs: [NFTModel.mock1.id])
        #expect(viewModel.favoriteNFTsData == [NFTModel.mock1])
    }
}

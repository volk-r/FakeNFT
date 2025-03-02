//
//  NFTCardViewModelTests.swift
//  FakeNFTTests
//
//  Created by Roman Romanov on 02.03.2025.
//

import Testing
@testable import FakeNFT

struct NFTCardViewModelTests {
    @Test func testSetLikeToFale() async {
        let viewModel: NFTCardViewModelProtocol = NFTCardViewModel()
        viewModel.setIsLiked(false)
        #expect(viewModel.isLiked == false)
    }
    
    @Test func testSetLikeToTrue() async {
        let viewModel: NFTCardViewModelProtocol = NFTCardViewModel()
        viewModel.setIsLiked(true)
        #expect(viewModel.isLiked == true)
    }
    
    @Test func testSetToggleLike() async {
        let viewModel: NFTCardViewModelProtocol = NFTCardViewModel()
        viewModel.setIsLiked(true)
        viewModel.likeToggle(for: "")
        #expect(viewModel.isLiked == false)
    }
}

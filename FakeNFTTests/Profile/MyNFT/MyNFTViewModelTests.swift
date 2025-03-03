//
//  MyNFTViewModelTests.swift
//  FakeNFTTests
//
//  Created by Roman Romanov on 02.03.2025.
//

import Testing
@testable import FakeNFT

struct MyNFTViewModelTests {
    
    @MainActor @Test func testSortByName() async {
        let viewModel: MyNFTViewModelProtocol = MyNFTViewModel()
        await viewModel.fetchMockNFTData()
        viewModel.setSorting(.byName)
            
        #expect(viewModel.nftsData[0].name == "Daryl")
        #expect(viewModel.nftsData[1].name == "Finn")
        #expect(viewModel.nftsData[2].name == "James")
    }
    
    @MainActor @Test func testSortByPrice() async {
        let viewModel: MyNFTViewModelProtocol = MyNFTViewModel()
        await viewModel.fetchMockNFTData()
        viewModel.setSorting(.byPrice)
        
        #expect(viewModel.nftsData[0].price == 11.14)
        #expect(viewModel.nftsData[1].price == 23.02)
        #expect(viewModel.nftsData[2].price == 28.27)
    }
    
    @MainActor @Test func testSortByRating() async {
        let viewModel: MyNFTViewModelProtocol = MyNFTViewModel()
        await viewModel.fetchMockNFTData()
        viewModel.setSorting(.byRating)
        
        #expect(viewModel.nftsData[0].rating == 5)
        #expect(viewModel.nftsData[1].rating == 3)
        #expect(viewModel.nftsData[2].rating == 2)
    }
}

//
//  MyNFTViewModelTests.swift
//  FakeNFTTests
//
//  Created by Roman Romanov on 02.03.2025.
//

import Foundation
import Testing
@testable import FakeNFT

struct MyNFTViewModelTests {
    @MainActor @Test func testInitState() async {
        let viewModel: MyNFTsViewModelProtocol = MyNFTsViewModel()
        
        let currentSortTypeKey = FakeNFT.AppStorageKey.Sorting.myNFTView
        let currentSortTypeValue =  UserDefaults.standard.string(forKey: currentSortTypeKey)
        UserDefaults.standard.removeObject(forKey: currentSortTypeKey)
        
        #expect(viewModel.sortType == .byRating)
        UserDefaults.standard.set(currentSortTypeValue, forKey: currentSortTypeKey)
        
        #expect(viewModel.showingSortingDialog == false)
        #expect(viewModel.loadingState == .default)
        #expect(viewModel.isEmptyNFTs)
        #expect(viewModel.nftsData.isEmpty)
    }
    
    @MainActor @Test func testSortByName() async {
        let viewModel: MyNFTsViewModelProtocol = MyNFTsViewModel()
        await viewModel.fetchMockNFTData()
        viewModel.setSorting(.byName)
            
        #expect(viewModel.nftsData[0].name == "Daryl")
        #expect(viewModel.nftsData[1].name == "Finn")
        #expect(viewModel.nftsData[2].name == "James")
    }
    
    @MainActor @Test func testSortByPrice() async {
        let viewModel: MyNFTsViewModelProtocol = MyNFTsViewModel()
        await viewModel.fetchMockNFTData()
        viewModel.setSorting(.byPrice)
        
        #expect(viewModel.nftsData[0].price == 11.14)
        #expect(viewModel.nftsData[1].price == 23.02)
        #expect(viewModel.nftsData[2].price == 28.27)
    }
    
    @MainActor @Test func testSortByRating() async {
        let viewModel: MyNFTsViewModelProtocol = MyNFTsViewModel()
        await viewModel.fetchMockNFTData()
        viewModel.setSorting(.byRating)
        
        #expect(viewModel.nftsData[0].rating == 5)
        #expect(viewModel.nftsData[1].rating == 3)
        #expect(viewModel.nftsData[2].rating == 2)
    }
}

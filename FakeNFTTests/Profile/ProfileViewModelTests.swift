//
//  ProfileViewModelTests.swift
//  FakeNFTTests
//
//  Created by Roman Romanov on 04.03.2025.
//

import Testing
@testable import FakeNFT

struct ProfileViewModelTest {
    @Test func testInitState() {
        let viewModel: ProfileViewModelProtocol = ProfileViewModel()
        
        #expect(viewModel.isMyNFTPresented == false)
        #expect(viewModel.isFavoriteNFTsPresented == false)
        #expect(viewModel.isDeveloperInfoPresented == false)
        #expect(viewModel.isEditProfilePresented == false)
        #expect(viewModel.profile == nil)
        #expect(viewModel.getMyNFTsCount() == 0)
        #expect(viewModel.getFavoriteNFTsCount() == 0)
    }
    
    @Test func testGetMyNFTsCount() {
        let viewModel: ProfileViewModelProtocol = ProfileViewModel()
        viewModel.loadMockProfile()
        
        #expect(viewModel.getMyNFTsCount() == 4)
    }
    
    @Test func testGetFavoriteNFTsCount() {
        let viewModel: ProfileViewModelProtocol = ProfileViewModel()
        viewModel.loadMockProfile()
        
        #expect(viewModel.getFavoriteNFTsCount() == 5)
    }
}

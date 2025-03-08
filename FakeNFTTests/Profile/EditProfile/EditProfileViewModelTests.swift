//
//  EditProfileViewModelTests.swift
//  FakeNFTTests
//
//  Created by Roman Romanov on 04.03.2025.
//

import Testing
@testable import FakeNFT

struct EditProfileViewModelTests {
    @Test func testInitState() {
        let viewModel: EditProfileViewModelProtocol = EditProfileViewModel()

        #expect(viewModel.avatarLink.isEmpty)
        #expect(viewModel.avatarLinkChangeable.isEmpty)
        #expect(viewModel.userName.isEmpty)
        #expect(viewModel.userDescription.isEmpty)
        #expect(viewModel.userWebsite.isEmpty)
        #expect(viewModel.userWebsite.isEmpty)
        #expect(viewModel.showDialog == false)
    }
    
    @Test func testSetupProfile() {
        let viewModel: EditProfileViewModelProtocol = EditProfileViewModel()
        let expectedProfile: ProfileModel = ProfileModel(
            id: "1",
            name: "name",
            avatar: "avatar",
            description: "description",
            website: "https://website.com/salom",
            nfts: []
        )
        viewModel.setupProfile(expectedProfile)
        
        #expect(viewModel.avatarLink == expectedProfile.avatar)
        #expect(viewModel.avatarLinkChangeable == expectedProfile.avatar)
        #expect(viewModel.userName == expectedProfile.name)
        #expect(viewModel.userDescription == expectedProfile.description)
        #expect(viewModel.userWebsite == expectedProfile.website)
        #expect(viewModel.showDialog == false)
    }
    
    @Test func testSetupEmptyProfile() {
        let viewModel: EditProfileViewModelProtocol = EditProfileViewModel()
        let expectedProfile: ProfileModel? = nil
        viewModel.setupProfile(expectedProfile)
        
        #expect(viewModel.avatarLink.isEmpty)
        #expect(viewModel.avatarLinkChangeable.isEmpty)
        #expect(viewModel.userName.isEmpty)
        #expect(viewModel.userDescription.isEmpty)
        #expect(viewModel.userWebsite.isEmpty)
        #expect(viewModel.userWebsite.isEmpty)
        #expect(viewModel.showDialog == false)
    }
    
    @Test func testUpdateAvatarLink() {
        let viewModel: EditProfileViewModelProtocol = EditProfileViewModel()
        let expectedAvatarValue = "https://example.com/avatar.png"
        
        viewModel.updateAvatarLink(expectedAvatarValue)
        #expect(viewModel.avatarLink == expectedAvatarValue)
        #expect(viewModel.avatarLinkChangeable.isEmpty)
        
        viewModel.updateAvatarLink("")
        #expect(viewModel.avatarLink == expectedAvatarValue)
        #expect(viewModel.avatarLinkChangeable == expectedAvatarValue)
    }
    
    @Test func testUpdateAvatarLinkEmpty() {
        let viewModel: EditProfileViewModelProtocol = EditProfileViewModel()
        viewModel.updateAvatarLink("")
        
        #expect(viewModel.avatarLink.isEmpty)
        #expect(viewModel.avatarLinkChangeable.isEmpty)
    }
}

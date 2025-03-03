//
//  ProfileViewModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 20.02.2025.
//

import Foundation

@Observable
final class ProfileViewModel: ProfileViewModelProtocol {
    
    // MARK: - Properties
    
    var isMyNFTPresented: Bool = false
    var isFavoriteNFTsPresented: Bool = false
    var isDeveloperInfoPresented: Bool = false
    var isEditProfilePresented: Bool = false
    
    private(set) var profile: ProfileModel?
    
    // MARK: - loadProfile
    
    func loadProfile() {
        // TODO: get profile from API
        loadMockProfile()
    }
    
    // MARK: - getMyNFTsCount
    
    func getMyNFTsCount() -> Int {
        profile?.nfts?.count ?? 0
    }
    
    // MARK: - getFavoriteNFTsCount
    
    func getFavoriteNFTsCount() -> Int {
        profile?.likes?.count ?? 0
    }
    
    // MARK: - loadMockProfile
    
    func loadMockProfile() {
        profile = ProfileModel(
            id: "1",
            name: "Joaquin Phoenix",
            avatar: "",
            description: "Дизайнер из Казани, люблю цифровое искусство и бейглы. В моей коллекции уже 100+ NFT, и еще больше — на моём сайте. Открыт к коллаборациям.",
            website: "http://JoaquinPhoenix.com",
            nfts: [
                "9810d484-c3fc-49e8-bc73-f5e602c36b40",
                "e8c1f0b6-5caf-4f65-8e5b-12f4bcb29efb",
                "594aaf01-5962-4ab7-a6b5-470ea37beb93",
                "cc74e9ab-2189-465f-a1a6-8405e07e9fe4",
                "c14cf3bc-7470-4eec-8a42-5eaa65f4053c"
            ],
            likes: [
                "9810d484-c3fc-49e8-bc73-f5e602c36b40",
                "e8c1f0b6-5caf-4f65-8e5b-12f4bcb29efb",
                "594aaf01-5962-4ab7-a6b5-470ea37beb93",
                "cc74e9ab-2189-465f-a1a6-8405e07e9fe4",
                "c14cf3bc-7470-4eec-8a42-5eaa65f4053c"
            ]
        )
    }
}

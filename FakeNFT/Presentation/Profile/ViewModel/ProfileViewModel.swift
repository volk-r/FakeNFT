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
    
    var isAboutPresented: Bool = false
    var isMyNFTPresented: Bool = false
    var profile: ProfileModel?
    
    // MARK: - loadProfile
    
    func loadProfile() {
        loadMockProfile()
    }
    
    func loadMockProfile() {
        profile = ProfileModel(
            id: "1",
            name: "Joaquin Phoenix",
            avatar: "",
            description: "Дизайнер из Казани, люблю цифровое искусство и бейглы. В моей коллекции уже 100+ NFT, и еще больше — на моём сайте. Открыт к коллаборациям.",
            website: "http://JoaquinPhoenix.com",
            nfts: Array(1...5).map( { String($0) }),
            likes: Array(1...15).map( { String($0) })
        )
    }
}

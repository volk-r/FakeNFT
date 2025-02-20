//
//  ProfileViewModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 20.02.2025.
//

import Foundation

@Observable
final class ProfileViewModel {
    var isAboutPresented: Bool = false
    
    var name: String = "Joaquin Phoenix"
    var userWebsite: String = "Joaquin Phoenix.com"
    var nftCount: Int = 112
    var nftFavoriteCount: Int = 12
    var useInfo: String = "Дизайнер из Казани, люблю цифровое искусство и бейглы. В моей коллекции уже 100+ NFT, и еще больше — на моём сайте. Открыт к коллаборациям."
    var userWebsiteURL: String = GlobalConstants.mockURL
}

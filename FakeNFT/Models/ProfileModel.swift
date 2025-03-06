//
//  ProfileModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 21.02.2025.
//

import Foundation

struct ProfileModel: Codable, Sendable {
    let id: String?
    let name: String?
    let avatar: String?
    let description: String?
    let website: String?
    let nfts: [String]?
    var likes: [String]?
}

extension ProfileModel {
    static let mockProfile: ProfileModel = ProfileModel(
        id: "1",
        name: "Joaquin Phoenix",
        avatar: "https://i.pinimg.com/736x/71/b6/c5/71b6c5ae9e78bc3783faba4d074c9ea2.jpg",
        description: "Дизайнер из Казани, люблю цифровое искусство и бейглы. В моей коллекции уже 100+ NFT, и еще больше — на моём сайте. Открыт к коллаборациям.",
        website: "http://JoaquinPhoenix.com",
        nfts: [
            "9810d484-c3fc-49e8-bc73-f5e602c36b40",
            "e8c1f0b6-5caf-4f65-8e5b-12f4bcb29efb",
            "594aaf01-5962-4ab7-a6b5-470ea37beb93",
            "cc74e9ab-2189-465f-a1a6-8405e07e9fe4"
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

//
//  NFTModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 22.02.2025.
//

import Foundation

struct NFTModel: Codable, Equatable, Identifiable {
    let createdAt: String
    let name: String
    let images: [String]
    let rating: Int
    let description: String
    let price: Double
    let author: String
    let id: String
}

extension NFTModel {
    static var mock1: NFTModel {
        NFTModel(
            createdAt: "2023-09-18T00:04:07.524Z[GMT]",
            name: "Melvin Yang",
            images: [
                "https://code.s3.yandex.net/Mobile/iOS/NFT/Gray/Dominique/1.png",
                "https://code.s3.yandex.net/Mobile/iOS/NFT/Gray/Dominique/2.png",
                "https://code.s3.yandex.net/Mobile/iOS/NFT/Gray/Dominique/3.png"
            ],
            rating: 3,
            description: "leo liber nobis nisi animal posidonium facilisi mauris",
            price: 8.04,
            author: "https://sharp_matsumoto.fakenfts.org/",
            id: "82570704-14ac-4679-9436-050f4a32a8a0"
        )
    }
    
    static var mock2: NFTModel {
        NFTModel(
            createdAt: "2023-06-10T11:42:16.363Z[GMT]",
            name: "Sharon Paul",
            images: [
                "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Lucky/1.png",
                "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Lucky/2.png",
                "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Lucky/3.png"
            ],
            rating: 3,
            description: "definitionem interesset nostrum quod theophrastus",
            price: 27.32,
            author: "https://youthful_bartik.fakenfts.org/",
            id: "e33e18d5-4fc2-466d-b651-028f78d771b8"
        )
    }
}

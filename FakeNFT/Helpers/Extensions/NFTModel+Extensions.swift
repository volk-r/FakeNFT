//
//  NFTModel+Extensions.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 07.03.2025.
//

extension NFTModel {
    static func placeholder(id: String) -> NFTModel {
        NFTModel(
            createdAt: "",
            name: "N/A",
            images: [],
            rating: 0,
            description: "N/A",
            price: 0.0,
            author: "",
            id: id
        )
    }
    
    static func isPlaceholder(_ nft: NFTModel) -> Bool {
        nft == placeholder(id: nft.id)
    }
}

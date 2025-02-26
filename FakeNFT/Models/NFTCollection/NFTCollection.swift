//
//  NFTCollection.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 23.02.2025.
//

import Foundation

/// Model for Collections response.
struct NFTCollection: Codable, Identifiable, Equatable {
    let createdAt: String
    let name: String
    let cover: String
    let nfts: [String]
    let description: String
    let author: String
    let id: String
}

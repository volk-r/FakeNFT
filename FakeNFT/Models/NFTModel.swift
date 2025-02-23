//
//  NFTModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 22.02.2025.
//

import Foundation

struct NFTModel: Codable, Equatable {
    let createdAt: String
    let name: String
    let images: [String]
    let rating: Int
    let description: String
    let price: Double
    let author: String
    let id: String
}

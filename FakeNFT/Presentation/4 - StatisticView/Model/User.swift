//
//  User.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 19.02.2025.
//

import Foundation

struct User: Identifiable, Sendable {
    let id: UUID
    let name: String
    let avatar: URL?
    let description: String?
    let website: URL?
    let nfts: [UUID]
    let rating: Int
}

//
//  ProfileModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 21.02.2025.
//

import Foundation

struct ProfileModel: Codable {
    let id: String?
    let name: String?
    let avatar: String?
    let description: String?
    let website: String?
    let nfts: [String]?
    var likes: [String]?
}

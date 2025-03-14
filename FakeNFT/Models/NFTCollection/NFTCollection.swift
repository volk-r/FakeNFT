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
    
    private enum CodingKeys: String, CodingKey {
        case createdAt, name, cover, nfts, description, author, id
    }
    
    init(createdAt: String,
         name: String,
         cover: String,
         nfts: [String],
         description: String,
         author: String,
         id: String) {
        self.createdAt = createdAt
        self.name = name
        self.cover = cover
        
        var seen = Set<String>()
        self.nfts = nfts.filter { seen.insert($0).inserted }
        
        self.description = description
        self.author = author
        self.id = id
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let createdAt = try container.decode(String.self, forKey: .createdAt)
        let name = try container.decode(String.self, forKey: .name)
        let cover = try container.decode(String.self, forKey: .cover)
        let nfts = try container.decode([String].self, forKey: .nfts)
        let description = try container.decode(String.self, forKey: .description)
        let author = try container.decode(String.self, forKey: .author)
        let id = try container.decode(String.self, forKey: .id)
        
        self.init(createdAt: createdAt,
                  name: name,
                  cover: cover,
                  nfts: nfts,
                  description: description,
                  author: author,
                  id: id)
    }
}

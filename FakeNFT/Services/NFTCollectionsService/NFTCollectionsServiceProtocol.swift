//
//  NFTCollectionsServiceProtocol.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 23.02.2025.
//

import Foundation

protocol NFTCollectionsServiceProtocol: Sendable {
    func loadCollections() async throws -> [NFTCollection]
}

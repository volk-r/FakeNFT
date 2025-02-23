//
//  NFTCollectionsServiceMock.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 23.02.2025.
//

import Foundation

actor NFTCollectionsServiceMock: NFTCollectionsServiceProtocol {
    func loadCollections() async throws -> [NFTCollection] {
        return [NFTCollection.mock1, NFTCollection.mock2]
    }
}

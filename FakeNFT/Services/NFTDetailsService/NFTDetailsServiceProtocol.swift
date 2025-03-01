//
//  NFTDetailsServiceProtocol.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 01.03.2025.
//

import Foundation

protocol NFTDetailsServiceProtocol: Sendable {
    func loadNFT(for ids: [String]) async throws -> [NFTModel]
}

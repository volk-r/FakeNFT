//
//  NFTDetailsServiceMock.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 01.03.2025.
//

import Foundation

actor NFTDetailsServiceMock: NFTDetailsServiceProtocol {
    func loadNFT(for ids: [String]) async throws -> [NFTModel] {
        return [NFTModel.mock1, NFTModel.mock2]
    }
}

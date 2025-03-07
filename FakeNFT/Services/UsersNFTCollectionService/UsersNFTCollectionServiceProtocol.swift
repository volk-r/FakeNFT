//
//  UsersNFTCollectionServiceProtocol.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 07.03.2025.
//

protocol UsersNFTCollectionServiceProtocol: Sendable {
    func getUsersNFTCollection(for ids: [String], onReceiveNFT: @MainActor @escaping (NFTModel) -> Void) async throws
    func cancelLoad() async
}

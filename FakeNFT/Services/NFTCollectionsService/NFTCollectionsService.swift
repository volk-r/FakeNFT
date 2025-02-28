//
//  NFTCollectionsService.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 23.02.2025.
//

import Foundation

actor NFTCollectionsService: NFTCollectionsServiceProtocol {
    private let networkService: NetworkServiceProtocol
    private var collectionsCache: [NFTCollection]?
    private var inProgressLoadTask: Task<[NFTCollection], Error>?

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func loadCollections() async throws -> [NFTCollection] {
        if let cached = collectionsCache {
            return cached
        }
        
        if let existingTask = inProgressLoadTask {
            return try await existingTask.value
        }
        
        let task = Task { () throws -> [NFTCollection] in
            let request = NFTCollectionsRequest()
            guard let collections: [NFTCollection] = try await networkService.send(request: request) else {
                throw NetworkServiceError.invalidResponse
            }
            self.collectionsCache = collections
            return collections
        }
        inProgressLoadTask = task
        defer { inProgressLoadTask = nil }
        
        return try await task.value
    }
}

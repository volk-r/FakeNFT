//
//  NFTCollectionsService.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 23.02.2025.
//

import Foundation

actor NFTCollectionsService: NFTCollectionsServiceProtocol {
    private let networkClient: NetworkClient
    private var collectionsCache: [NFTCollection]?
    private var inProgressLoadTask: Task<[NFTCollection], Error>?
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func loadCollections() async throws -> [NFTCollection] {
        if let cached = collectionsCache {
            return cached
        }
        
        if let existingTask = inProgressLoadTask {
            return try await existingTask.value
        }
        
        let newTask = Task<[NFTCollection], Error> {
            return try await withCheckedThrowingContinuation { continuation in
                let request = NFTCollectionsRequest()
                
                networkClient.send(request: request, type: [NFTCollection].self, completionQueue: .main) { [weak self] result in
                    Task {
                        guard let self = self else { return }

                        switch result {
                        case .success(let collections):
                            await self.setCache(collections)
                            continuation.resume(returning: collections)
                        case .failure(let error):
                            continuation.resume(throwing: error)
                        }
                    }
                }
            }
        }
        
        inProgressLoadTask = newTask
        
        do {
            let collections = try await newTask.value
            inProgressLoadTask = nil
            return collections
        } catch {
            inProgressLoadTask = nil
            throw error
        }
    }
    
    // MARK: - Private Helpers

    // Helper to assign to the cache safely within the actor
    private func setCache(_ newValue: [NFTCollection]) {
        self.collectionsCache = newValue
    }
}

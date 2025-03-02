//
//  NFTDetailsService.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 01.03.2025.
//

import Foundation

actor NFTDetailsService: NFTDetailsServiceProtocol {
    private let networkService: NetworkServiceProtocol
    private var inProgressLoadTask: Task<[NFTModel], Error>?
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func loadNFT(for ids: [String]) async throws -> [NFTModel] {
        if let existingTask = inProgressLoadTask {
            return try await existingTask.value
        }
        
        let task = Task { () throws -> [NFTModel] in
            defer { inProgressLoadTask = nil }
            let models: [NFTModel] = try await withThrowingTaskGroup(of: NFTModel?.self) { group in
                for id in ids {
                    group.addTask {
                        let request = NFTRequest(id: id)
                        return try await self.networkService.send(request: request) as NFTModel?
                    }
                }
                
                var nftModels = [NFTModel]()
                
                for try await nft in group {
                    if let nft = nft {
                        nftModels.append(nft)
                    }
                }
                
                return nftModels
            }
            return models
        }
        inProgressLoadTask = task
        return try await task.value
    }
}

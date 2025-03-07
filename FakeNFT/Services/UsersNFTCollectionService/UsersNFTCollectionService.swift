//
//  UsersNFTCollectionService.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 07.03.2025.
//

actor UsersNFTCollectionService: UsersNFTCollectionServiceProtocol {
    // MARK: - Constants

    private let networkService: NetworkServiceProtocol

    // MARK: - Private Properties

    private var currentTask: Task<Void, Error>?

    // MARK: - Initializers
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    // MARK: - Public Methods
    
    func getUsersNFTCollection(for ids: [String], onReceiveNFT: @escaping @MainActor @Sendable (NFTModel) -> Void) async throws {
        currentTask?.cancel()
        
        let task = Task {
            try await withThrowingTaskGroup(of: Result<NFTModel?, Error>.self) { group in
                for id in ids {
                    group.addTask {
                        guard !Task.isCancelled else { return .failure(CancellationError()) }
                        let request = NFTRequest(id: id)
                        do {
                            let nft = try await self.networkService.send(request: request) as NFTModel?
                            if let nft = nft {
                                await onReceiveNFT(nft)
                            }
                            return .success(nft)
                        } catch {
                            return .failure(error)
                        }
                    }
                }
                for try await result in group {
                    if case .failure(let error) = result {
                        print("Ошибка загрузки NFT: \(error)")
                    }
                }
            }
        }
        currentTask = task
        try await task.value
    }
    
    func cancelLoad() async {
        currentTask?.cancel()
        currentTask = nil
    }
}

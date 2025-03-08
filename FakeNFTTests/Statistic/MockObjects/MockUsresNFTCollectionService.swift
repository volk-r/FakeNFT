//
//  MockUsresNFTCollectionService.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 08.03.2025.
//

import Testing
import Foundation
@testable import FakeNFT

actor MockUsresNFTCollectionService: NetworkServiceProtocol {
    var callCount = 0
    private var shouldThrowError = false
    private var mockResponse: [FakeNFT.NFTModel] = []

    func send<T>(request: any FakeNFT.NetworkRequest) async throws -> T? where T: Decodable & Sendable {
        callCount += 1
        if shouldThrowError {
            throw NetworkServiceError.invalidResponse
        }
        guard let request = request as? FakeNFT.NFTRequest else {
            throw NetworkServiceError.urlRequestError
        }
        if let nft = mockResponse.first(where: { $0.id == request.id }) as? T {
            return nft
        } else {
            throw NetworkServiceError.invalidResponse
        }
    }

    func setupShouldThrowError(_ shouldThrowError: Bool) {
        self.shouldThrowError = shouldThrowError
    }

    func setupMockResponse(_ response: [FakeNFT.NFTModel]) {
        self.mockResponse = response
    }
}

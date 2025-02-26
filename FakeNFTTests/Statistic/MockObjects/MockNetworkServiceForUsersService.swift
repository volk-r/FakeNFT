//
//  MockNetworkServiceForUsersService.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 26.02.2025.
//

import Testing
@testable import FakeNFT

actor MockNetworkServiceForUsersService: NetworkServiceProtocol {
    var callCount = 0
    private var shouldThrowError = false
    private var mockResponse: [User] = []

    func send<T>(request: any FakeNFT.NetworkRequest) async throws -> T? where T: Decodable & Sendable {
        callCount += 1
        if shouldThrowError {
            throw NetworkServiceError.invalidResponse
        }
        guard let response = mockResponse as? T else {
            throw NetworkServiceError.invalidResponse
        }
        return response
    }

    func setupMockResponse(_ response: [User]) {
        self.mockResponse = response
    }

    func setupShouldThrowError(_ shouldThrowError: Bool) {
        self.shouldThrowError = shouldThrowError
    }
}

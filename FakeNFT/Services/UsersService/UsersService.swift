//
//  UsersService.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 23.02.2025.
//
import Foundation

actor UsersService: UsersServiceProtocol {
    // MARK: - Constants

    private let networkService: NetworkService

    // MARK: - Initializers

    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }

    // MARK: - Public Methods

    func loadUsers(fromPage page: Int, count: Int, sortBy: UsersSortType) async throws -> [User] {
        let request = UsersRequest(page: page, size: count, sortBy: sortBy)

        if let users: [User] = try await networkService.send(request: request) {
            return users
        } else {
            throw NetworkServiceError.invalidResponse
        }
    }
}

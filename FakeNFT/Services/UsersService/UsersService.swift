//
//  UsersService.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 23.02.2025.
//
import Foundation

actor UsersService: UsersServiceProtocol {
    // MARK: - Constants

    private let networkService: NetworkServiceProtocol

    // MARK: - Private Properties

    private var usersCache: [UsersCache] = []

    // MARK: - Initializers

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    // MARK: - Public Methods

    func clearCache() async {
        usersCache = []
    }
    
    func loadUsers(fromPage page: Int, count: Int, sortBy: UsersSortType) async throws -> [User] {
        if let cachedUsers = usersCache.first(
            where: {
                $0.page == page && $0.count == count && $0.sortBy == sortBy
            }) {
            return cachedUsers.users
        }
        
        let request = UsersRequest(page: page, size: count, sortBy: sortBy)

        if let users: [User] = try await networkService.send(request: request) {
            usersCache.append(
                UsersCache(
                    page: page,
                    count: count,
                    sortBy: sortBy,
                    users: users
                )
            )
            return users
        } else {
            throw NetworkServiceError.invalidResponse
        }
    }
}

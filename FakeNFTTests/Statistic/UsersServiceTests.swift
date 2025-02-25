//
//  UsersServiceTests.swift
//  FakeNFTTests
//
//  Created by Сергей Кухарев on 25.02.2025.
//

import Testing
@testable import FakeNFT

struct UsersServiceTests {
    
    /// Проверка кэширования данных
    /// Цель теста: убедиться, что данные загружаются из кэша, если они уже там есть, и обращение в Сеть не производится
    /// План теста: вызываем loadUsers, затем вызываем его повторно с теми же параметрами и проверяем, что повторный поход в Сеть не производится
    @Test func test_ReturnsCacheData() async throws {
        // Arrange
        let mockNetworkService = MockNetworkServiceForUsersService()
        let usersService = UsersService(networkService: mockNetworkService)
        let expectedUsers = [User(id: "1", name: "Sergei Kukharev", avatar: "", description: nil, website: "", nfts: [], rating: "1")]
        await mockNetworkService.setupMockResponse(expectedUsers)
        await usersService.clearCache()

        // Act
        _ = try await usersService.loadUsers(fromPage: 0, count: 20, sortBy: .byRating)
        let secondCallUsers = try await usersService.loadUsers(fromPage: 0, count: 20, sortBy: .byRating)

        // Assert
        #expect(secondCallUsers == expectedUsers)
        await #expect(mockNetworkService.callCount == 1)
    }
    
    /// Проверка загрузки данных из Сети, в случае если они отсутствуют в кэше
    /// Цель теста: убедиться в том, что данные загружаются из Сети при их отсутствии в кэше
    /// План теста: очищаем кэш сервиса, вызываем loadUsers, убеждаемся в том, что был один поход в Сеть
    @Test func test_fetchDataFromNetwork() async throws {
        // Arrange
        let mockNetworkService = MockNetworkServiceForUsersService()
        let usersService = UsersService(networkService: mockNetworkService)
        let expectedUsers = [User(id: "1", name: "Sergei Kukharev", avatar: "", description: nil, website: "", nfts: [], rating: "1")]
        await mockNetworkService.setupMockResponse(expectedUsers)
        await usersService.clearCache()

        // Act
        let users = try await usersService.loadUsers(fromPage: 0, count: 20, sortBy: .byRating)

        // Assert
        #expect(users == expectedUsers)
        await #expect(mockNetworkService.callCount == 1)
    }
    
}

actor MockNetworkServiceForUsersService: NetworkServiceProtocol {
    var callCount = 0
    var shouldThrowError = false
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
}

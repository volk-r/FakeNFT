//
//  StatisticViewModel.swift
//  FakeNFTTests
//
//  Created by Сергей Кухарев on 26.02.2025.
//

import Testing
@testable import FakeNFT

struct StatisticViewModelTests {

    /// Тест начального состояния ViewModel
    /// Цель теста: убедиться в том, что ViewModel создаётся с корректными начальными значениями
    /// План теста: создать ViewModel, сравнить значения с эталонными
    @Test func test_initViewModel() async throws {
        // Arrange
        let viewModel = await StatisticViewModel()

        // Act & Assert
        await MainActor.run {
            #expect(viewModel.loadingState == .default)
            #expect(viewModel.users.isEmpty)
            #expect(viewModel.showingErrorAlert == false)
            #expect(viewModel.showingSortDialog == false)
        }
    }

    /// Тест загрузки данных loadData()
    /// Цель теста: убедиться в том, что вызов loadData() приводит к походу в Сеть и к загрузке данных в users
    /// План теста: создать ViewModel, вызвать loadData(), убедится в том, что:
    /// - loadingState сначала .loading, а затем .success
    /// - users не пуст и равен ожидаемым данным
    @Test func test_loadData() async throws {
        // Arrange
        let mockNetworkService = MockNetworkServiceForUsersService()
        let usersService = UsersService(networkService: mockNetworkService)
        let viewModel = await StatisticViewModel(usersService: usersService)
        let expectedUsers = [User(id: "1", name: "Sergei Kukharev", avatar: "", description: nil, website: "", nfts: [], rating: "1")]
        await mockNetworkService.setupMockResponse(expectedUsers)
        await usersService.clearCache()

        // Act
        await viewModel.loadData()
        
        // Assert
        await MainActor.run {
            #expect(viewModel.loadingState == .success)
            #expect(viewModel.users == expectedUsers)
        }
    }

    /// Тест обработки ошибок Сети
    /// Цель теста: убедиться в том, что при возникновении ошибки загрузки данных устанавливается переменная,
    /// отвечающая за отображение сообщения об ошибке
    /// План теста: присвоить loadingState значение ошибки и убедиться в том, что showingAlertError == true
    @Test func test_loadDataErrors() async throws {
        // Arrange
        let mockNetworkService = MockNetworkServiceForUsersService()
        let usersService = UsersService(networkService: mockNetworkService)
        let viewModel = await StatisticViewModel(usersService: usersService)
        await mockNetworkService.setupShouldThrowError(true)

        // Act
        await viewModel.loadData()

        // Assert
        await MainActor.run {
            #expect(viewModel.loadingState == .failure)
            #expect(viewModel.showingErrorAlert)
        }
    }

    /// Тест на сортировку данных
    /// Цель теста: убедиться в том, что изменение значения сортировки приводит к загрузке данных из Сети
    /// План теста: поменять значение сортировки и убедиться в том, что вызывается loadData()
    @Test func test_sortingData() async throws {
        // Arrange
        let mockNetworkService = MockNetworkServiceForUsersService()
        let usersService = UsersService(networkService: mockNetworkService)
        let viewModel = await StatisticViewModel(usersService: usersService)
        let expectedUsers = [User(id: "1", name: "Sergei Kukharev", avatar: "", description: nil, website: "", nfts: [], rating: "1")]
        await mockNetworkService.setupMockResponse(expectedUsers)
        await usersService.clearCache()

        // Act
        await MainActor.run {
            if viewModel.sortType == .byRating {
                viewModel.sortType = .byName
            } else {
                viewModel.sortType = .byRating
            }
        }

        await withCheckedContinuation { continuation in
            Task {
                while await viewModel.loadingState == .loading {
                    try? await Task.sleep(for: .seconds(0.1)) 
                }
                continuation.resume()
            }
        }

        // Assert
        await MainActor.run {
            #expect(viewModel.loadingState == .success)
            #expect(viewModel.users == expectedUsers)
        }
    }

    /// Тест сортировки данных
    /// Цель теста: убедиться в том, что вызов функции сортировки приводит к отображению диалогового окна с выбором режима сортировки
    /// План теста: вызвать sortList() и убедиться в том, что showingSortDialog == true
    @Test func test_sortList() async throws {
        // Arrange
        let viewModel = await StatisticViewModel()

        // Act
        await viewModel.sortList()
        
        // Assert
        await MainActor.run {
            #expect(viewModel.showingSortDialog)
        }
    }
}

//
//  UsersCollectionTests.swift
//  FakeNFTTests
//
//  Created by Сергей Кухарев on 08.03.2025.
//

import Testing
@testable import FakeNFT

struct UsersCollectionTests {
    /// Тест начального состояния ViewModel
    /// Цель теста: убедиться в том, что ViewModel создаётся с корректными начальными значениями
    /// План теста: создать ViewModel, сравнить значения с эталонными
    @Test func test_initViewModel() async throws {
        // Arrange
        let viewModel = await UsersCollectionViewModel()

        // Act & Assert
        await MainActor.run {
            #expect(viewModel.loadingState == .default)
            #expect(viewModel.nftModels.isEmpty)
            #expect(viewModel.showingErrorAlert == false)
        }
    }

    /// Тест загрузки данных loadData()
    /// Цель теста: убедиться в том, что вызов loadData() приводит к походу в Сеть и к загрузке данных в users
    /// План теста: создать ViewModel, вызвать loadData(), убедится в том, что:
    /// - loadingState сначала .loading, а затем .success
    /// - nftModels не пуст и равен ожидаемым данным
    @Test func test_loadData() async throws {
        // Arrange
        let mockNetworkService = MockUsresNFTCollectionService()
        let usersNFTCollectionService = UsersNFTCollectionService(networkService: mockNetworkService)
        let viewModel = await UsersCollectionViewModel(loadingService: usersNFTCollectionService)
        let expectedNfts = [NFTModel.mock1, NFTModel.mock2]
        await mockNetworkService.setupMockResponse(expectedNfts)

        // Act
        await viewModel.loadData(withNFTs: [NFTModel.mock1.id, NFTModel.mock2.id])
        
        // Assert
        await MainActor.run {
            #expect(viewModel.loadingState == .success)
            #expect(viewModel.nftModels == expectedNfts)
        }
    }

    /// Тест обработки ошибок Сети
    /// Цель теста: убедиться в том, что при возникновении ошибки загрузки данных устанавливается переменная,
    /// отвечающая за отображение сообщения об ошибке
    /// План теста: присвоить loadingState значение ошибки и убедиться в том, что showingAlertError == true
    @Test func test_loadDataErrors() async throws {
        // Arrange
        let mockNetworkService = MockUsresNFTCollectionService()
        let usersNFTCollectionService = UsersNFTCollectionService(networkService: mockNetworkService)
        let viewModel = await UsersCollectionViewModel(loadingService: usersNFTCollectionService)
        await mockNetworkService.setupShouldThrowError(true)

        // Act
        await viewModel.loadData(withNFTs: [NFTModel.mock1.id, NFTModel.mock2.id])

        // Assert
        await MainActor.run {
            #expect(viewModel.loadingState == .failure)
            #expect(viewModel.showingErrorAlert)
        }
    }
}

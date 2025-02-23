//
//  StatisticViewModel.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 19.02.2025.
//

import Foundation

@Observable
@MainActor
final class StatisticViewModel: StatisticViewModelProtocol {
    // MARK: - Types

    private enum Constants {
        static let batchSize: Int = 20
    }

    // MARK: - Public Properties

    var loadingState: LoadingState = .default
    var users: [User] = []
    var showingErrorAlert: Bool = false
    var showingSortDialog: Bool = false
    var sortType: UsersSortType = .byRating {
        didSet {
            Task {
                await loadData()
            }
        }
    }

    // MARK: - Private Properties

    private var loadingDataMode: LoadingDataMode = .default
    private var currentPage: Int = 0
    private let usersService = UsersService()

    // MARK: - Public Methods

    func loadData() async {
        do {
            if loadingState == .loading {
                return
            }
            loadingDataMode = .loadData
            users = try await usersService.loadUsers(
                fromPage: currentPage,
                count: Constants.batchSize,
                sortBy: sortType
            )
            currentPage += 1
            loadingState = .success
        } catch {
            showingErrorAlert = true
            loadingState = .failure
        }
    }

    func fetchNextData() async {
        do {
            loadingDataMode = .fetchMoreData
            print("Fetch more data...")
        } catch {
            showingErrorAlert = true
        }
    }

    func reloadData() async {
        do {
            loadingDataMode = .reloadData
            print("Reload data...")
            users = try User.getMockData()
            throw URLError(.badServerResponse)
        } catch {
            print("throwed error")
            showingErrorAlert = true
        }
    }

    func retryLoadingData() async {
        switch loadingDataMode {
        case .default:
            break
        case .loadData:
            await loadData()
        case .fetchMoreData:
            await fetchNextData()
        case .reloadData:
            await reloadData()
        }
    }

    func sortList() {
        showingSortDialog = true
    }
}

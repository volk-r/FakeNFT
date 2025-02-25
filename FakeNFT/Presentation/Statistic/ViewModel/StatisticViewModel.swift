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
        static let prefetchCount: Int = 10
    }

    // MARK: - Constants

    private let usersService = UsersService()

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
    private var isNoMoreDataInTheUsersList: Bool = false

    // MARK: - Public Methods

    func loadData() async {
        do {
            guard loadingState != .loading else { return }
            loadingState = .loading
            loadingDataMode = .loadData
            isNoMoreDataInTheUsersList = false
            currentPage = 0
            users = try await usersService.loadUsers(
                fromPage: currentPage,
                count: Constants.batchSize,
                sortBy: sortType
            )
            loadingState = .success
        } catch { 
            showingErrorAlert = true
            loadingState = .failure
        }
    }

    func fetchNextDataIfNeeded(currentRowIndex: Int) async {
        guard currentRowIndex >= users.count - Constants.prefetchCount else { return }
        await fetchNextData()
    }

    func retryLoadingData() async {
        switch loadingDataMode {
        case .default:
            break
        case .loadData:
            await loadData()
        case .fetchNextData:
            await fetchNextData()
        }
    }

    func sortList() {
        showingSortDialog = true
    }

    // MARK: - Private Methods

    private func fetchNextData() async {
        do {
            guard loadingState != .loading  && !isNoMoreDataInTheUsersList else { return }
            loadingState = .loading
            loadingDataMode = .fetchNextData
            let newUsers = try await usersService.loadUsers(
                fromPage: currentPage + 1,
                count: Constants.batchSize,
                sortBy: sortType
            )
            if newUsers.isEmpty {
                isNoMoreDataInTheUsersList = true
            } else {
                currentPage += 1
            }
            users.append(contentsOf: newUsers)
            loadingState = .success
        } catch {
            showingErrorAlert = true
            loadingState = .failure
        }
    }
}

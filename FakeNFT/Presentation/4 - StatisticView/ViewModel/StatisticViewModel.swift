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
    // MARK: - Public Properties

    var loadingState: LoadingState = .default
    
    var users: [User] = []

    // MARK: - Public Methods

    func loadData() async throws {
        users = User.getMockData()
    }

    func fetchNextData() async throws {
    }

    func sortList() {
        print("Sort button pressed")
    }
}

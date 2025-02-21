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
    var users: [User] = []

    func loadData() async throws {
    }

    func fetchNextData() async throws {
    }

    func sortList() {
        print("Sort button pressed")
    }
}

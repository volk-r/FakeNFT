//
//  StatisticViewModelProtocol.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 19.02.2025.
//

import Foundation

@MainActor
protocol StatisticViewModelProtocol: AnyObject, Sendable, Observable {
    var loadingState: LoadingState { get set }
    var users: [User] { get }
    var showingSortDialog: Bool { get set }
    var showingErrorAlert: Bool { get set }
    var sortType: UsersSortType { get set }
    func fetchNextData() async
    func loadData() async
    func reloadData() async
    func retryLoadingData() async
    func sortList()
}

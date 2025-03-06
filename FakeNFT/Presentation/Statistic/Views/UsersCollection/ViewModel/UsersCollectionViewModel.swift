//
//  UsersCollectionViewModel.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 05.03.2025.
//

import SwiftUI

@Observable
@MainActor
final class UsersCollectionViewModel: UsersCollectionViewModelProtocol {
    // MARK: - Public Properties

    var loadingState: LoadingState = .default {
        didSet {
            if loadingState == .failure {
                showingErrorAlert = true
            }
        }
    }
    var nftModels: [NFTModel] = []
    var showingErrorAlert: Bool = false

    // MARK: - Public Methods

    func loadData() async {
        do {
            guard loadingState != .loading else { return }

            loadingState = .success
        } catch {
            loadingState = .failure
        }
    }
}

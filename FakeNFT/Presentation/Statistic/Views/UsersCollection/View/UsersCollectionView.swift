//
//  UsersCollectionView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 04.03.2025.
//

import SwiftUI

struct UsersCollectionView: View {
    // MARK: - Constants

    let userData: UserData
    private let columns = Array(
        repeating: GridItem(.flexible(), spacing: 9),
        count: 3
    )
    
    // MARK: - State

    @State private var viewModel: UsersCollectionViewModelProtocol

    // MARK: - Binding

    @Environment(\.dismiss) var dismiss

    // MARK: - Initializers

    init(
        userData: UserData,
        viewModel: UsersCollectionViewModelProtocol = UsersCollectionViewModel()
    ) {
        self.userData = userData
        self.viewModel = viewModel
    }

    // MARK: - View

    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.nftModels) { nft in
                        UserCollectionViewCell(nft: nft)
                    }
                }
                .padding(.horizontal, Constants.collectionHorizontalPadding)
                .padding(.top, Constants.collectionTopPadding)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("UsersCollectionViewTitle")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: dismissView) {
                    Image(systemName: GlobalConstants.chevronLeftImageName)
                        .imageScale(.large)
                }
            }
        }
        .foregroundStyle(Constants.defaultForegroundColor)
        .toolbar(.hidden, for: .tabBar)
        .alert(
            "",
            isPresented: $viewModel.showingErrorAlert,
            actions: {
                Button("StatisticViewCancelButton", role: .cancel) {}
                Button("StatisticViewRetryButton") {
                    Task {
                        await viewModel.loadData(withNFTs: userData.nfts)
                    }
                }
                .keyboardShortcut(.defaultAction)
            },
            message: {
                Text("StatisticViewErrorText")
            }
        )
        .task {
            await viewModel.loadData(withNFTs: userData.nfts)
        }
    }

    // MARK: - Private Methods

    private func dismissView() {
        dismiss()
    }
}

private extension UsersCollectionView {
    // MARK: - Types

    private enum Constants {
        static let defaultForegroundColor: Color = .appBlack
        static let collectionHorizontalPadding: CGFloat = 16
        static let collectionTopPadding: CGFloat = 20
        static let loadingProgressViewSize: CGFloat = 80
        static let loadingProgressViewCornerRadius: CGFloat = 12
        static let loadingDataBackgroundShading: CGFloat = 0.4
        static let loadingDataBackgroundColor: Color = .appWhite
   }
}

#Preview {
    NavigationStack {
        UsersCollectionView(
            userData: UserData(
                id: User.getMockUserData().id,
                nfts: User.getMockUserData().nfts
            )
        )
    }
}

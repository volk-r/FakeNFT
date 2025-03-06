//
//  UsersCollectionView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 04.03.2025.
//

import SwiftUI

struct UsersCollectionView: View {
    // MARK: - Constants

    let id: String
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
        id: String,
        viewModel: UsersCollectionViewModelProtocol = UsersCollectionViewModel()
    ) {
        self.id = id
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
            }
            
            if viewModel.loadingState == .loading {
                loadingIndicator
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
        .task {
            await viewModel.loadData()
        }
    }

    // MARK: - Private Properties

    private var loadingIndicator: some View {
        ZStack {
            Color.black.opacity(Constants.loadingDataBackgroundShading)
            ProgressView()
                .frame(
                    width: Constants.loadingProgressViewSize,
                    height: Constants.loadingProgressViewSize
                )
                .background(Constants.loadingDataBackgroundColor)
                .cornerRadius(Constants.loadingProgressViewCornerRadius)
        }
        .allowsHitTesting(true)
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
        static let collectionTopPadding: CGFloat = 20
        static let loadingProgressViewSize: CGFloat = 80
        static let loadingProgressViewCornerRadius: CGFloat = 12
        static let loadingDataBackgroundShading: CGFloat = 0.4
        static let loadingDataBackgroundColor: Color = .appWhite
   }
}

#Preview {
    NavigationStack {
        UsersCollectionView(id: User.getMockUserData().id)
    }
}

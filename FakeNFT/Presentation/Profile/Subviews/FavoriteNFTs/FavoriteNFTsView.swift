//
//  FavoriteNFTsView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 26.02.2025.
//

import SwiftUI

struct FavoriteNFTsView: View {
    
    // MARK: - Properties
    
    let likes: [String]
    @State private var viewModel: FavoriteNFTsViewModelProtocol = FavoriteNFTsViewModel()
    
    private let gridColumns = [
        GridItem(.adaptive(minimum: 168, maximum: 200), spacing: 7)
    ]
    
    // MARK: - body
    
    var body: some View {
        VStack {
            if viewModel.isEmptyNFTs {
                Text("You don't have any featured NFTs yet")
                    .appTextStyleBodyBold()
                    .accessibilityIdentifier(AppAccessibilityId.FavoriteNFTs.noNFTs)
            } else {
                LoadingSwitcher(
                    viewModel.loadingState,
                    content: { favoriteNFTsList }
                )
            }
        }
        .navigationTitle(viewModel.isEmptyNFTs ? "" : "Favorite NFTs")
        .toolbarRole(.editor)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchNFTData(likeIDs: likes)
        }
        .onChange(of: likes) {
            viewModel.updateFavoriteNFTsData(likeIDs: likes)
        }
    }
}

extension FavoriteNFTsView {
    
    // MARK: - favoriteNFTsList
    
    private var favoriteNFTsList: some View {
        ScrollView {
            LazyVGrid(
                columns: gridColumns,
                spacing: 20
            ) {
                ForEach(viewModel.favoriteNFTsData) { data in
                    FavoriteNFTCardView(nftData: data)
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 16)
        }
    }
}

#Preview("Favorite NFT") {
    NavigationStack {
        FavoriteNFTsView(likes: ProfileModel.mockProfile.likes ?? [])
    }
}

#Preview("No Favorite NFT") {
    NavigationStack {
        FavoriteNFTsView(likes: [])
    }
}

//
//  FavoriteNFTsView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 26.02.2025.
//

import SwiftUI

struct FavoriteNFTsView: View {
    
    // MARK: - Properties
    
    @Environment(ProfileViewModel.self) var profileModel
    @State private var viewModel: FavoriteNFTsViewModelProtocol = FavoriteNFTsViewModel()
    
    private let gridColumns = [
        GridItem(.adaptive(minimum: 168, maximum: 200), spacing: 7)
    ]
    
    // MARK: - body
    
    var body: some View {
        VStack {
            if profileModel.profile?.nfts == nil {
                Text("You don't have any featured NFTs yet")
                    .appTextStyleBodyBold()
            } else {
                LoadingSwitcher(
                    viewModel.loadingState,
                    content: { favoriteNFTsList },
                    error: { errorContent }
                )
            }
        }
        .navigationTitle(viewModel.isEmptyNFTs ? "" : "Favorite NFTs")
        .toolbarRole(.editor)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchNFTData(likeIDs: profileModel.profile?.likes)
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
                    FavoriteNFTCardView(
                        nftData: data,
                        isLiked: profileModel.profile?.likes?.contains(data.id) ?? false
                    )
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 16)
        }
    }
    
    // MARK: - errorContent
    
    // TODO: need general error view
    private var errorContent: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Something went wrong")
                .appTextStyleHeadline3(withColor: .appRedUniversal)
            Text("Try again later")
                .appTextStyleHeadline3(withColor: .appRedUniversal)
        }
    }
}

#Preview("Favorite NFT") {
    let viewModel = ProfileViewModel()
    NavigationStack {
        FavoriteNFTsView()
            .environment(viewModel)
    }
    .onAppear {
        viewModel.loadMockProfile()
    }
}

#Preview("No Favorite NFT") {
    NavigationStack {
        FavoriteNFTsView()
            .environment(ProfileViewModel())
    }
}

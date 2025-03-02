//
//  MyNFTView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 23.02.2025.
//

import SwiftUI

struct MyNFTView: View {
    
    // MARK: - Properties
    
    @Environment(ProfileViewModel.self) var profileModel
    @State private var viewModel: MyNFTViewModelProtocol = MyNFTViewModel()
    
    // MARK: - body
    
    var body: some View {
        VStack {
            if viewModel.isEmptyNFTs {
                Text("You don't have NFT yet")
                    .appTextStyleBodyBold()
            } else {
                LoadingSwitcher(
                    viewModel.loadingState,
                    content: { myNFTsList },
                    loading: { loadingContent },
                    error: { errorContent }
                )
            }
        }
        .toolbar {
            Group {
                if !viewModel.isEmptyNFTs {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        sortButton
                    }
                }
            }
        }
        .navigationTitle(viewModel.isEmptyNFTs ? "" : "My NFT")
        .toolbarRole(.editor)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchNFTData(nftIDs: profileModel.profile?.nfts)
        }
        .confirmationDialog(
            NFTSortingType.description,
            isPresented: $viewModel.showingSortingDialog,
            titleVisibility: .visible
        ) {
            Button(NFTSortingType.byPrice.title) {
                viewModel.setSorting(.byPrice)
            }
            Button(NFTSortingType.byRating.title) {
                viewModel.setSorting(.byRating)
            }
            Button(NFTSortingType.byName.title) {
                viewModel.setSorting(.byName)
            }
            Button("Close", role: .cancel, action: {
                viewModel.showingSortingDialog = false
            })
        }
    }
}

extension MyNFTView {
    
    // MARK: - sortButton
    
    private var sortButton: some View {
        Button(
            action: {
                viewModel.showingSortingDialog = true
            },
            label: {
                Image(.appSortButton)
                    .resizable()
                    .foregroundColor(.appBlack)
                    .padding(.trailing, 9)
            }
        )
    }
    
    // MARK: - myNFTsList
    
    private var myNFTsList: some View {
        List(viewModel.nftsData, id: \.id) { data in
            Section {
                NFTCardView(
                    nftData: data,
                    isLiked: profileModel.profile?.likes?.contains(data.id) ?? false
                )
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .padding(.top)
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
    
    // MARK: - loadingContent
    
    private var loadingContent: some View {
        VStack(alignment: .center) {
            ProgressView()
        }
    }
}

#Preview("NFT") {
    let viewModel = ProfileViewModel()
    NavigationStack {
        MyNFTView()
            .environment(viewModel)
    }
    .onAppear {
        viewModel.loadMockProfile()
    }
}

#Preview("No NFT") {
    NavigationStack {
        MyNFTView()
            .environment(ProfileViewModel())
    }
}

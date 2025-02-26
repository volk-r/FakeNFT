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
            if profileModel.profile?.nfts == nil {
                Text("You don't have NFT yet")
                    .appTextStyleBodyBold()
            } else {
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
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                sortButton
            }
        }
        .navigationTitle("My NFT")
        .toolbarRole(.editor)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchNFTData(nftIDs: profileModel.profile?.nfts)
        }
        .task {
            await viewModel.loadPageSettings()
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

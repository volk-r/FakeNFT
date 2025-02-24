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
    @State var model: MyNFTViewModel = MyNFTViewModel()
    
    // MARK: - body
    
    var body: some View {
        VStack {
            if profileModel.profile?.nfts == nil {
                Text("You don't have NFT yet")
                    .appTextStyleBodyBold()
            } else {
                List(model.nftsData, id: \.id) { data in
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
            model.fetchNFTData(nftIDs: profileModel.profile?.nfts)
        }
        .task {
            await model.loadPageSettings()
        }
        .confirmationDialog(
            NFTSortingType.description,
            isPresented: $model.showingSortingDialog,
            titleVisibility: .visible
        ) {
            Button(NFTSortingType.byPrice.title) {
                model.sortType = .byPrice
            }
            Button(NFTSortingType.byRating.title) {
                model.sortType = .byRating
            }
            Button(NFTSortingType.byName.title) {
                model.sortType = .byName
            }
            Button("Close", role: .cancel, action: {
                model.showingSortingDialog = false
            })
        }
    }
}

extension MyNFTView {
    
    // MARK: - sortButton
    
    private var sortButton: some View {
        Button(
            action: {
                model.showingSortingDialog = true
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
    let model = ProfileViewModel()
    NavigationStack {
        MyNFTView()
            .environment(model)
    }.onAppear {
        model.loadMockProfile()
    }
}

#Preview("No NFT") {
    NavigationStack {
        MyNFTView()
            .environment(ProfileViewModel())
    }
}

//
//  MyNFsTView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 23.02.2025.
//

import SwiftUI

struct MyNFTsView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var profileManager: ProfileManager
    @State private var viewModel: MyNFTsViewModelProtocol
    
    init(viewModel: MyNFTsViewModelProtocol = MyNFTsViewModel()) {
        self.viewModel = viewModel
    }
    
    // MARK: - body
    
    var body: some View {
        VStack {
            if viewModel.isEmptyNFTs {
                Text("You don't have NFT yet")
                    .appTextStyleBodyBold()
                    .accessibilityIdentifier(AppAccessibilityId.MyNFTs.noNFTs)
            } else {
                LoadingSwitcher(
                    viewModel.loadingState,
                    content: { myNFTsList },
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
            await viewModel.fetchNFTData(nftIDs: profileManager.profile?.nfts)
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

extension MyNFTsView {
    
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
                NFTCardView(nftData: data)
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
}

#Preview("NFT") {
    @Previewable @StateObject var profileManager = ProfileManager(profileService: ProfileMockService())    
    let model: MyNFTsViewModelProtocol = MyNFTsViewModel()

    return AsyncPreviewModel {
        NavigationStack {
            MyNFTsView(viewModel: model)
                .environmentObject(profileManager)
        }
    } model: {
        
    }
    .task {
        try? await profileManager.loadProfile(for: GlobalConstants.mockProfileID)
        await model.fetchMockNFTData()
    }
}

#Preview("No NFT") {
    NavigationStack {
        MyNFTsView()
            .environmentObject(ProfileManager(profileService: ProfileMockService()))
    }
}

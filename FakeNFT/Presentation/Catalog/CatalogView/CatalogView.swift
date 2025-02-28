//
//  CatalogView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//

import SwiftUI

struct CatalogView<ViewModel: CatalogViewModelProtocol>: View {
    // MARK: - Properties
    
    @ObservedObject var viewModel: ViewModel
    @State private var isSortDialogPresented = false
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            LoadingSwitcher(viewModel.loadingState) {
                collectionList
            } error: {
                Text("Failed to retrieve data")
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
            .toolbar {
                toolbarItem
            }
        }
        .overlay(sortDialog)
        .task {
            await viewModel.loadCollections()
        }
    }
    
    // MARK: - Subviews
    
    private var collectionList: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                ForEach(viewModel.sortedCollections) { collection in
                    CatalogRow(collection: collection)
                }
            }
        }
    }
    
    private var toolbarItem: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                isSortDialogPresented = true
            } label: {
                Image(.appSortButton)
                    .foregroundStyle(.appBlack)
            }
        }
    }
    
    private var sortDialog: some View {
        EmptyView()
            .confirmationDialog(
                "Sorting",
                isPresented: $isSortDialogPresented,
                titleVisibility: .visible
            ) {
                Button("By Title") {
                    viewModel.sortOrder = .title
                }
                Button("By NFT Count") {
                    viewModel.sortOrder = .nftCount
                }
                Button("Close", role: .cancel) { }
            }
    }
}

#Preview {
    CatalogView(viewModel: CatalogViewModel(collectionsService: NFTCollectionsServiceMock()))
}

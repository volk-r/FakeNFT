//
//  CatalogView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//

import SwiftUI

struct CatalogView: View {
    @ObservedObject var viewModel: CatalogViewModel
    @State private var isSortDialogPresented = false
    
    var body: some View {
        NavigationStack {
            LoadingSwitcher(viewModel.loadingState) {
                collectionList
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
    
    private var collectionList: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                ForEach(viewModel.collections) { collection in
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
                "Sort",
                isPresented: $isSortDialogPresented,
                titleVisibility: .visible
            ) {
                Button("By Name") {
                    
                }
                Button("By NFT Count") {
                    
                }
                Button("Close", role: .cancel) { }
            }
    }
}

#Preview {
    CatalogView(viewModel: CatalogViewModel(networkService: NFTCollectionsServiceMock()))
}

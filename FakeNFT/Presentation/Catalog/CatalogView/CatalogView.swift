//
//  CatalogView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//

import SwiftUI

struct CatalogView: View {
    @ObservedObject var viewModel: CatalogViewModel
    
    var body: some View {
        NavigationStack {
            LoadingSwitcher(viewModel.loadingState) {
                collectionList
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
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
}

#Preview {
    CatalogView(viewModel: CatalogViewModel(networkService: NFTCollectionsServiceMock()))
}

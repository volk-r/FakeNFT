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
                List(viewModel.collections) { collection in
                    Text(collection.name)
                        .font(.headline)
                }
            }
        }
        .task {
            await viewModel.loadCollections()
        }
    }
}

#Preview {
    CatalogView(viewModel: CatalogViewModel(networkService: NFTCollectionsServiceMock()))
}

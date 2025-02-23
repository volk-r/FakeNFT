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
        List(viewModel.collections) { collection in
            Text(collection.name)
                .font(.headline)
        }
        .onAppear {
            viewModel.loadCollections()
        }
    }
}

#Preview {
    CatalogView(viewModel: CatalogViewModel(networkService: NFTCollectionsServiceMock()))
}

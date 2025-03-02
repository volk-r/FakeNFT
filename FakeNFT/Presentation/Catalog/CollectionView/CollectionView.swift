//
//  CollectionView.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 28.02.2025.
//

import SwiftUI

struct CollectionView: View {
    @ObservedObject var viewModel: CollectionViewModel
    @Environment(\.dismiss) private var dismiss
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 3)
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                coverView
                
                VStack(alignment: .leading, spacing: 0) {
                    titleView
                    authorView
                    descriptionView
                    nftCollectionView
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            toolbarItem
        }
        .task {
            await viewModel.loadNFT()
        }
    }
    
    // MARK: - Subviews
    
    private var coverView: some View {
        ImageLoaderFactory(url: viewModel.collection.cover, contentMode: .fill)
            .frame(maxWidth: .infinity)
            .frame(height: 310)
            .cornerRadius(12)
            .ignoresSafeArea(edges: .top)
    }
    
    private var titleView: some View {
        Text(viewModel.collection.name.capitalized)
            .appTextStyleHeadline3()
    }
    
    private var authorView: some View {
        HStack(spacing: 4) {
            Text("Author of the collection:")
                .appTextStyleCaption2()
            
            Button {
                // Open viewModel.authorLink in Web View
            } label: {
                Text(viewModel.collection.author)
                    .appTextStyleCaption1(withColor: .appBlueUniversal)
            }
        }
        .padding(.top, 8)
    }
    
    private var descriptionView: some View {
        Text(viewModel.collection.description.capitalized)
            .appTextStyleCaption2()
            .padding(.top, 4)
    }
    
    private var nftCollectionView: some View {
        LoadingSwitcher(viewModel.loadingState) {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.nftModels) { nft in
                    CollectionNFTCell(nft: nft)
                }
            }
        } error: {
            Text("Failed to retrieve data")
                .appTextStyleCaption2()
        }
        .padding(.top, 24)
    }
    
    private var toolbarItem: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .tint(.appBlack)
            }
        }
    }
}

#Preview {
    NavigationStack {
        CollectionView(
            viewModel: CollectionViewModel(
                collection: NFTCollection.mock1,
                nftDetailsService: NFTDetailsServiceMock()
            )
        )
    }
}

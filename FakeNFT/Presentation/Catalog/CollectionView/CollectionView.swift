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
    
    let columns = [GridItem(.adaptive(minimum: 120), spacing: 16)]
    
    var body: some View {
        ScrollView {
            cover
            
            VStack(alignment: .leading) {
                title
                
                if viewModel.nftModels.isEmpty {
                    ProgressView()
                        .padding()
                } else {
                    nftCollection
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
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
    
    private var cover: some View {
        ImageLoaderFactory(url: viewModel.collection.cover, contentMode: .fill)
            .frame(maxWidth: .infinity)
            .frame(height: 310)
            .cornerRadius(12)
            .ignoresSafeArea(edges: .top)
    }
    
    private var title: some View {
        Text(viewModel.collection.name.capitalized)
            .appTextStyleHeadline3()
    }
    
    private var nftCollection: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(viewModel.nftModels) { nft in
                Text(nft.name)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 2)
            }
        }
        .padding(.top, 16)
    }
    
    private var toolbarItem: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.appBlack)
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

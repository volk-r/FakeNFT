//
//  MyNFTView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 23.02.2025.
//

import SwiftUI

struct MyNFTView: View {
    
    // MARK: - Properties
    
    let nfts: [String]
    let likes: [String]
    
    // MARK: - body
    
    var body: some View {
        VStack {
            if nfts.isEmpty {
                Text("You don't have NFT yet")
                    .appTextStyleBodyBold()
            } else {
                List(nfts, id: \.self) { nft in
                    Section {
                        NFTCardView(
                            id: nft,
                            isLiked: Binding(
                                get: { likes.contains(nft) },
                                set: {_ in }
                            )
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
    }
}

extension MyNFTView {
    
    // MARK: - sortButton
    
    private var sortButton: some View {
        Button(
            action: {
                // TODO: - open edit view
                print("Sort called")
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
    Group {
        NavigationStack {
            MyNFTView(nfts: ["1", "2", "3", "4", "5"], likes: ["1", "4"])
        }
    }
}

#Preview("No NFT") {
    NavigationStack {
        MyNFTView(nfts: [], likes: [])
    }
}

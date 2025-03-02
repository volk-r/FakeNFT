//
//  CollectionNFTCell.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 02.03.2025.
//

import SwiftUI

struct CollectionNFTCell: View {
    let nft: NFTModel
    
    private var nftDisplayName: String {
        nft.name.split(separator: " ").first.map(String.init) ?? nft.name
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            NFTCard(
                imageUrl: nft.images.first ?? "",
                isLiked: false,
                сardType: .normal,
                action: {
                    // Change Like
                }
            )
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    NFTCardDescription(
                        descriptionType: .belowRating,
                        rating: nft.rating,
                        title: nftDisplayName
                    )
                    
                    Text("\(nft.price, specifier: "%.2f") ETH")
                        .appTextStyleCaption3()
                }
                
                Button {
                    // Add to Cart
                } label: {
                    Image(systemName: "cart.fill")
                        .tint(.appBlack)
                }
            }
        }
        .aspectRatio(108/192, contentMode: .fit)
    }
}

#Preview {
    CollectionNFTCell(nft: NFTModel.mock1)
}

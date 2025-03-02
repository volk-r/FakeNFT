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
    private var priceText: String {
        String(format: "%.2f ETH", nft.price)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            NFTCard(
                imageUrl: nft.images.first ?? "",
                isLiked: false,
                сardType: .flexible,
                action: {
                    // Change Like
                }
            )
            
            NFTCardDescription(
                descriptionType: .none,
                rating: nft.rating
            )
            .padding(.top, 8)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(nftDisplayName)
                        .appTextStyleBodyBold()
                        .lineLimit(1)
                    
                    Text(verbatim: priceText)
                        .appTextStyleCaption3()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    // Add to Cart
                } label: {
                    Image(.appAddToCart)
                        .tint(.appBlack)
                }
                .frame(width: 40, height: 40)
            }
            .padding(.top, 4)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    CollectionNFTCell(nft: NFTModel.mock1)
        .frame(width: 120, height: 200)
}

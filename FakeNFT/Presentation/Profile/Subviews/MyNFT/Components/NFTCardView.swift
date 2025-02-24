//
//  NFTCardView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 23.02.2025.
//

import SwiftUI

struct NFTCardView: View {
    
    // MARK: - Properties
    
    let nftData: NFTModel
    let isLiked: Bool
    @State private var model: NFTCardViewModel = NFTCardViewModel()
    
    // MARK: - body
    
    var body: some View {
        HStack {
            NFTCard(
                imageUrl: nftData.images.first ?? "",
                isLiked: model.isLiked,
                сardType: .normal
            ) {
                model.likeToggle(for: nftData.id)
            }
            description
            price
        }
        .onAppear {
            model.setIsLiked(isLiked)
        }
    }
}

extension NFTCardView {
    
    // MARK: - description
    
    private var description: some View {
        VStack(alignment: .leading) {
            NFTCardDescription(
                descriptionType: .aboveRating,
                rating: nftData.rating,
                title: nftData.name
            )
                
            HStack(alignment: .bottom) {
                Text("from")
                    .appTextStyleCaption1()
                Text(nftData.author)
                    .appTextStyleCaption2()
            }
            .padding(.top, 4)
        }
        .padding(.leading, 20)
    }
    
    // MARK: - price
    
    private var price: some View {
        VStack(alignment: .leading) {
            Text("Price")
                .appTextStyleCaption2()
            PriceView(price: nftData.price)
        }
        .padding(.leading, 28)
    }
}

#Preview {
    let model = MyNFTViewModel()
    model.fetchMockNFTData()
    
    return VStack {
        NFTCardView(
            nftData: model.nftsData.first!,
            isLiked: true
        )
        .padding(.horizontal)
        
        NFTCardView(
            nftData: model.nftsData.last!,
            isLiked: false
        )
        .padding(.horizontal)
    }
}

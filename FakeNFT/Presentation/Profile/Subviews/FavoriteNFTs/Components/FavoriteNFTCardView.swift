//
//  FavoriteNFTCardView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 26.02.2025.
//

import SwiftUI

struct FavoriteNFTCardView: View {
    
    // MARK: - Properties
    
    let nftData: NFTModel
    let isLiked: Bool
    @State private var viewModel: NFTCardViewModelProtocol = NFTCardViewModel()
    
    // MARK: - body
    
    var body: some View {
        HStack {
            NFTCard(
                imageUrl: nftData.images.first ?? "",
                isLiked: viewModel.isLiked,
                сardType: .mini
            ) {
                viewModel.likeToggle(for: nftData.id)
            }
            
            VStack(alignment: .leading) {
                NFTCardDescription(
                    descriptionType: .aboveRating,
                    rating: nftData.rating,
                    title: nftData.name
                )
                    
                PriceView(price: nftData.price)
                    .appTextStyleCaption1()
                    .padding(.top, 8)
            }
        }
        .onAppear {
            viewModel.setIsLiked(isLiked)
        }
    }
}

#Preview {
    let model = FavoriteNFTsViewModel()
    
    return AsyncPreviewModel {
        HStack(spacing: 8) {
            FavoriteNFTCardView(
                nftData: model.favoriteNFTsData.first!,
                isLiked: true
            )
            
            FavoriteNFTCardView(
                nftData: model.favoriteNFTsData.last!,
                isLiked: false
            )
        }
        .padding(.horizontal, 16)
    } model: {
        await model.fetchMockNFTData()
    }
}

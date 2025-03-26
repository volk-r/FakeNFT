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
    
    @EnvironmentObject var profileManager: ProfileManager
    
    // MARK: - body
    
    var body: some View {
        HStack {
            NFTCard(
                imageUrl: nftData.images.first ?? "",
                isLiked: profileManager.isLiked(nftId: nftData.id),
                сardType: .mini,
                isDisabled: profileManager.likeIsDisabled
            ) {
                Task {
                    try? await profileManager.toggleLike(for: nftData.id)
                }
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
    }
}

#Preview {
    @Previewable @StateObject var profileManager = ProfileManager(profileService: ProfileMockService())
    let model = FavoriteNFTsViewModel()
    
    return AsyncPreviewModel {
        HStack(spacing: 8) {
            FavoriteNFTCardView(nftData: model.favoriteNFTsData.first!)
                .environmentObject(profileManager)
            
            FavoriteNFTCardView(nftData: model.favoriteNFTsData.last!)
                .environmentObject(profileManager)
        }
        .padding(.horizontal, 16)
    } model: {
        await model.fetchMockNFTData()
    }
    .task {
        try? await profileManager.loadProfile(for: GlobalConstants.mockProfileID)
    }
}

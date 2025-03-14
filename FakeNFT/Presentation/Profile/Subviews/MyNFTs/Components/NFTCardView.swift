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
    @EnvironmentObject var profileManager: ProfileManager
    
    // MARK: - body
    
    var body: some View {
        HStack {
            NFTCard(
                imageUrl: nftData.images.first ?? "",
                isLiked: profileManager.isLiked(nftId: nftData.id),
                сardType: .normal,
                isDisabled: profileManager.likeIsDisabled
            ) {
                Task {
                    try? await profileManager.toggleLike(for: nftData.id)
                }
            }
            description
            price
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
                .appTextStyleBodyBold()
        }
        .padding(.leading, 28)
    }
}

#Preview {
    let model = MyNFTsViewModel()
    let profileManager = ProfileManager(profileService: ProfileMockService())
    
    return AsyncPreviewModel {
        VStack {
            NFTCardView(nftData: model.nftsData.first!)
                .padding(.horizontal)
                .environmentObject(profileManager)
            
            NFTCardView(nftData: model.nftsData.last!)
                .padding(.horizontal)
                .environmentObject(profileManager)
        }
        .padding()
    } model: {
        await model.fetchMockNFTData()
    }
    .task {
        try? await profileManager.loadProfile(for: GlobalConstants.mockProfileID)
    }
}

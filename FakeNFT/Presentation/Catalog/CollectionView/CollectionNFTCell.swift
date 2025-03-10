//
//  CollectionNFTCell.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 02.03.2025.
//

import SwiftUI

struct CollectionNFTCell: View {
    @EnvironmentObject var profileManager: ProfileManager
    @EnvironmentObject var orderManager: OrderManager
    
    let nft: NFTModel
    
    private var nftDisplayName: String {
        nft.name.split(separator: " ").first.map(String.init) ?? nft.name
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            nftCardView
            nftRatingView
            nftDetailsView
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    
    // MARK: - Subviews
    
    private var nftCardView: some View {
        NFTCard(
            imageUrl: nft.images.first ?? "",
            isLiked: profileManager.isLiked(nftId: nft.id),
            сardType: .flexible,
            isDisabled: profileManager.likeIsDisabled,
            action: {
                Task {
                    try await profileManager.toggleLike(for: nft.id)
                }
            }
        )
    }
    
    private var nftRatingView: some View {
        NFTCardDescription(
            descriptionType: .none,
            rating: nft.rating
        )
        .padding(.top, 8)
    }
    
    private var nftDetailsView: some View {
        HStack {
            detailsTextView
            addToCartButton
        }
        .padding(.top, 4)
    }
    
    private var detailsTextView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(nftDisplayName)
                .appTextStyleBodyBold()
                .lineLimit(1)
            
            PriceView(price: nft.price)
                .appTextStyleCaption3()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var addToCartButton: some View {
        Button {
            Task {
                try await orderManager.toggleNFT(nft.id)
            }
        } label: {
            Image(orderManager.isNFTInOrder(nft.id) ? .appRemoveFromCart : .appAddToCart)
                .tint(.appBlack)
        }
        .frame(width: 40, height: 40)
    }
}

#Preview {
    let profileManager = ProfileManager(profileService: ProfileMockService())
    let orderManager = OrderManager(orderService: OrderMockService())
    
    CollectionNFTCell(nft: NFTModel.mock1)
        .frame(width: 120, height: 200)
        .environmentObject(profileManager)
        .environmentObject(orderManager)
        .onAppear {
            Task {
                try? await profileManager.loadProfile(for: GlobalConstants.mockProfileID)
                try? await orderManager.loadOrder()
            }
        }
}

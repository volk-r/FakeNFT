//
//  ProfileView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var profileManager: ProfileManager
    @State private var nft1: NFTModel = .mock1
    @State private var nft2: NFTModel = .mock2
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Profile View")
            
            NFTCard(
                imageUrl: nft1.images.first ?? "",
                isLiked: profileManager.isLiked(nftId: nft1.id),
                сardType: .normal,
                isDisabled: profileManager.likeIsDisabled,
                action: {
                    Task {
                        await profileManager.toggleLike(for: nft1.id)
                    }
                }
            )
            
            NFTCard(
                imageUrl: nft2.images.first ?? "",
                isLiked: profileManager.isLiked(nftId: nft2.id),
                сardType: .normal,
                isDisabled: profileManager.likeIsDisabled,
                action: {
                    Task {
                        await profileManager.toggleLike(for: nft2.id)
                    }
                }
            )
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}

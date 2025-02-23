//
//  NFTCard.swift
//  FakeNFT
//
//  Created by Roman Romanov on 22.02.2025.
//

import SwiftUI

struct NFTCard: View {
    
    // MARK: - Properties
    
    let image: Image
    var isLiked: Bool
    var сardType: NFTCardType = .normal
    let action: () -> Void
    
    // MARK: - body
    
    var body: some View {
        likeView
            .frame(
                width: сardType.cardSize,
                height: сardType.cardSize
            )
            .background {
                image
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(12)
            }
    }
}

extension NFTCard {
    var likeView: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundStyle(
                        isLiked
                        ? .appRedUniversal
                        : .appWhiteUniversal
                    )
                    .onTapGesture {
                        action()
                    }
                    .frame(
                        width: сardType.likeWidth,
                        height: сardType.likeHeight
                    )
                    .padding(.trailing, сardType.likeTrailingPadding)
                    .padding(.top, сardType.likeTopPadding)
            }
            Spacer()
        }
    }
}

// MARK: - Preview

#Preview {
    NFTCard(
        image: Image(.nftCard),
        isLiked: false,
        action: { print("print 1") }
    )
    
    NFTCard(
        image: Image(.nftCard),
        isLiked: true,
        action: { print("print 2") }
    )
    
    NFTCard(
        image: Image(.nftCard),
        isLiked: false,
        сardType: .mini,
        action: { print("print 3") }
    )
    
    NFTCard(
        image: Image(.nftCard),
        isLiked: true,
        сardType: .mini,
        action: { print("print 4") }
    )
}

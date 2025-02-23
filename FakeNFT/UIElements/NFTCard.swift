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
                    .frame(
                        maxWidth: сardType.cardSize,
                        maxHeight: сardType.cardSize
                    )
                    .scaledToFit()
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
                    .frame(
                        width: сardType.likeWidth,
                        height: сardType.likeHeight
                    )
                    .padding(.trailing, сardType.likeTrailingPadding)
                    .padding(.top, сardType.likeTopPadding)
                    .background(
                        Color.clear
                            .frame(width: 44, height: 44)
                            .contentShape(Rectangle())
                    )
                    .onTapGesture {
                        action()
                    }
            }
            Spacer()
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.gray.opacity(0.7)
            .ignoresSafeArea()
        VStack {
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
                image: Image(systemName: "questionmark"),
                isLiked: false,
                action: { print("print 1") }
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
            
            NFTCard(
                image: Image(systemName: "questionmark"),
                isLiked: false,
                сardType: .mini,
                action: { print("print 1") }
            )
        }
    }
}

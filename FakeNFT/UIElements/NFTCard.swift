//
//  NFTCard.swift
//  FakeNFT
//
//  Created by Roman Romanov on 22.02.2025.
//

import SwiftUI

struct NFTCard: View {
    
    // MARK: - Properties
    
    let imageUrl: String
    var isLiked: Bool
    var сardType: NFTCardType = .normal
    let action: () -> Void
    
    // MARK: - body
    
    var body: some View {
        if сardType == .flexible {
            ZStack(alignment: .topTrailing) {
                ImageLoaderFactory(url: imageUrl, contentMode: .fit)
                    .cornerRadius(12)
                likeView
            }
            .aspectRatio(1, contentMode: .fit)
        } else {
            fixedCardView
                .frame(
                    width: сardType.cardSize,
                    height: сardType.cardSize
                )
                .background {
                    ImageLoaderFactory(
                        url: imageUrl,
                        contentMode: .fit
                    )
                    .frame(
                        maxWidth: сardType.cardSize,
                        maxHeight: сardType.cardSize
                    )
                    .scaledToFit()
                    .cornerRadius(12)
                }
        }
    }
}

extension NFTCard {
    var fixedCardView: some View {
        VStack {
            HStack {
                Spacer()
                likeView
            }
            Spacer()
        }
    }
    
    var likeView: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .foregroundStyle(
                isLiked ? .appRedUniversal : .appWhiteUniversal
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
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.gray.opacity(0.7)
            .ignoresSafeArea()
        VStack {
            NFTCard(
                imageUrl: GlobalConstants.mockPreviewImageUrl,
                isLiked: false,
                action: { print("print 1") }
            )
            
            NFTCard(
                imageUrl: GlobalConstants.mockPreviewImageUrl,
                isLiked: true,
                action: { print("print 2") }
            )
            
            NFTCard(
                imageUrl: "http://",
                isLiked: false,
                action: { print("print 1") }
            )
            
            NFTCard(
                imageUrl: GlobalConstants.mockPreviewImageUrl,
                isLiked: false,
                сardType: .mini,
                action: { print("print 3") }
            )
            
            NFTCard(
                imageUrl: GlobalConstants.mockPreviewImageUrl,
                isLiked: true,
                сardType: .mini,
                action: { print("print 4") }
            )
            
            NFTCard(
                imageUrl: "http://",
                isLiked: false,
                сardType: .mini,
                action: { print("print 1") }
            )
        }
    }
}

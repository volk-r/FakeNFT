//
//  UserCollectionViewCell.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 06.03.2025.
//

import SwiftUI

struct UserCollectionViewCell: View {
    // MARK: - Constants

    let nft: NFTModel

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            NFTCard(imageUrl: nft.images.first ?? "",
                    isLiked: false,
                    сardType: .normal,
                    action: {
                print("Like pressed")
            })
            NFTCardDescription(
                descriptionType: .none,
                rating: nft.rating
            )
            .padding(.top, Constants.cardDescriptionTopPadding)
            .padding(.bottom, Constants.cardDescriptionBottomPadding)
            HStack {
                VStack(
                    alignment: .leading,
                    spacing: Constants.cardItemsSpacing
                ) {
                    Text(nftDisplayName)
                        .appTextStyleBodyBold()
                        .lineLimit(1)
                    PriceView(price: nft.price)
                        .appTextStyleCaption3()
                }
                Spacer()
                Image(.appAddToCart)
                    .tint(.appBlack)
                    .frame(
                        width: Constants.cartImageSize,
                        height: Constants.cartImageSize
                    )
            }
        }
        .frame(width: .infinity)
    }

    // MARK: - Private Properties

    private var nftDisplayName: String {
        nft.name.split(separator: " ").first.map(String.init) ?? nft.name
    }
}

private extension UserCollectionViewCell {
    // MARK: - Types

    private enum Constants {
        static let cardDescriptionTopPadding: CGFloat = 8
        static let cardDescriptionBottomPadding: CGFloat = 4
        static let cardItemsSpacing: CGFloat = 4
        static let cartImageSize: CGFloat = 40
    }
}

#Preview {
    UserCollectionViewCell(nft: NFTModel.mock1)
        .frame(width: 108, height: 172)
}

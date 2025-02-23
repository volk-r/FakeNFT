//
//  NFTCardView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 23.02.2025.
//

import SwiftUI

struct NFTCardView: View {
    
    // MARK: - Properties
    
    let id: String
    @Binding var isLiked: Bool
    @State private var model: NFTCardViewModel = NFTCardViewModel()
    
    // MARK: - body
    
    var body: some View {
        HStack {
            NFTCard(
                imageUrl: model.cardData.images.first ?? "",
                isLiked: isLiked,
                сardType: .normal
            ) {
                model.likeAction($isLiked, for: id)
            }
            description
            price
        }
        .task {
            
        }
    }
}

extension NFTCardView {
    
    // MARK: - description
    
    private var description: some View {
        VStack(alignment: .leading) {
            NFTCardDescription(
                descriptionType: .aboveRating,
                rating: model.cardData.rating,
                title: model.cardData.name
            )
                
            HStack(alignment: .bottom) {
                Text("from")
                    .appTextStyleCaption1()
                Text(model.cardData.author)
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
            Text("\(model.cardData.price) ETH")
                .appTextStyleBodyBold()
        }
        .padding(.leading, 28)
    }
}

#Preview {
    NFTCardView(id: "1", isLiked: .constant(true))
        .padding(.horizontal)
    
    NFTCardView(id: "2", isLiked: .constant(false))
        .padding(.horizontal)
}

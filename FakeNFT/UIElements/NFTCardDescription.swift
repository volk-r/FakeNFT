//
//  NFTCardDescription.swift
//  FakeNFT
//
//  Created by Roman Romanov on 22.02.2025.
//

import SwiftUI

struct NFTCardDescription: View {
    
    // MARK: - Properties
    
    let descriptionType: NFTCardDescriptionType
    let rating: Int
    var title: String = ""
    
    let maxRating: Int = 5
    
    // MARK: - body
    
    var body: some View {
        VStack(alignment: .leading) {
            if descriptionType == .aboveRating {
                description
                    .padding(.bottom, 4)
            }
            ratingProgress
            if descriptionType == .belowRating {
                description
                    .padding(.top, 4)
            }
        }
    }
}

extension NFTCardDescription {
    
    // MARK: - NFTCardDescriptionType
    
    enum NFTCardDescriptionType: CaseIterable {
        case none
        case aboveRating
        case belowRating
    }
    
    // MARK: - description
    
    var description: some View {
        Text(title)
            .appTextStyleBodyBold()
            .lineLimit(1)
            .accessibilityIdentifier(AppAccessibilityId.NFTCard.description)
    }
    
    // MARK: - ratingProgress
    
    var ratingProgress: some View {
        HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(
                        index < rating
                        ? .appYellowUniversal
                        : .appLightGray
                    )
                    .font(.system(size: 12))
            }
        }
    }
}

// MARK: - Preview

#Preview {
    VStack {
        NFTCardDescription(descriptionType: .aboveRating, rating: 3, title: "Lilo")
            .padding()
        NFTCardDescription(descriptionType: .aboveRating, rating: 5, title: "Spring")
            .padding()
        NFTCardDescription(descriptionType: .aboveRating, rating: 0, title: "April")
            .padding()
        Divider()
        NFTCardDescription(descriptionType: .belowRating, rating: 3, title: "Lilo")
            .padding()
        NFTCardDescription(descriptionType: .belowRating, rating: 5, title: "Spring")
            .padding()
        NFTCardDescription(descriptionType: .belowRating, rating: 0, title: "April")
            .padding()
        Divider()
        NFTCardDescription(descriptionType: .none, rating: 5)
            .padding()
        NFTCardDescription(descriptionType: .none, rating: 1)
            .padding()
        NFTCardDescription(descriptionType: .none, rating: 0)
            .padding()
    }
    .background(Color(.green).opacity(0.3))
}

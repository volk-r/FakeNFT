//
//  RatingView.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/25/25.
//

import SwiftUI

struct RatingView: View {
    let rating: Int
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5, id: \.self) { number in
                Image(.appStar)
                    .resizable()
                    .foregroundStyle(number > rating ? .appLightGray : .appYellowUniversal)
                    .frame(width: 12, height: 12)
            }
        }
    }
}

#Preview {
    RatingView(rating: 4)
}

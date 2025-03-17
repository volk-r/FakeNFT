//
//  CartToolbarView.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/25/25.
//

import SwiftUI

struct CartToolbarView: View {
    let item: CartToolbarItem
    let onPayment: () -> Void
    
    var body: some View {
        HStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 2) {
                Text("\(item.count) NFT")
                PriceView(price: item.price)
                    .appTextStyleBodyBold(
                        withColor: .appGreenUniversal
                    )
            }
            Button(action: onPayment, label: {
                Text("For payment")
                    .appTextStyleBodyBold(withColor: .appWhite)
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 32
                    )
            })
            .buttonStyle(.borderedProminent)
            .tint(.appBlack)
            .cornerRadius(16)
        }
        .padding(16)
        .background(.appLightGray)
        .clipShape(
            .rect(
                topLeadingRadius: 12,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 12
            )
        )
    }
}

#Preview {
    CartToolbarView(
        item: .init(
            count: 3,
            price: 5.34
        )
    ) {
        
    }
}

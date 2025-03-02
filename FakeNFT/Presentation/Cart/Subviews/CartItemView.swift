//
//  CartItemView.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/25/25.
//

import SwiftUI

struct CartItemView: View {
    let item: CartItem
    let onDelete: () -> Void
    
    var body: some View {
        HStack(spacing: 20) {
            image
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    header
                    price
                }
                .padding(.vertical, 8)
                Spacer()
                deleteButton
            }
        }
    }
    
    var image: some View {
        ImageLoaderFactory(
            url: item.imageUrl
        )
        .cornerRadius(12)
        .frame(width: 108, height: 108)
    }
    
    var header: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(item.name)
                .appTextStyleBodyBold()
            RatingView(rating: item.rating)
        }
    }
    
    var price: some View {
        VStack(alignment: .leading) {
            Text("Price")
                .appTextStyleBodyRegular()
            PriceView(price: item.price)
        }
    }
    
    var deleteButton: some View {
        Button(action: onDelete, label: {
            Image(.appTrash)
                .tint(.appBlack)
        })
    }
}

#Preview {
    CartItemView(
        item: .mockItem
    ) {
        
    }
    .padding()
}

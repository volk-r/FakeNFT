//
//  PurchaseItemView.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/25/25.
//

import SwiftUI

struct PurchaseItemView: View {
    let item: PurchaseItem
    var isSelected: Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            image
            info
            Spacer()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    .appBlack,
                    lineWidth: isSelected ? 1 : 0
                )
        )
        .background(.appLightGray)
        .cornerRadius(12)
    }
    
    var image: some View {
        ImageLoaderFactory(
            url: item.imageUrl
        )
        .cornerRadius(6)
        .frame(width: 36, height: 36)
        .padding(.leading, 12)
        .padding(.vertical, 5)
    }
    
    var info: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .appTextStyleCaption2()
            Text(item.ticker)
                .appTextStyleCaption2(withColor: .appGreenUniversal)
        }
    }
}

#Preview {
    Group {
        PurchaseItemView(item: .mockItem, isSelected: true)
        PurchaseItemView(item: .mockItem)
    }
    .padding()
}

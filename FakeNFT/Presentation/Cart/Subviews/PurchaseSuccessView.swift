//
//  PurchaseSuccessView.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/25/25.
//

import SwiftUI

struct PurchaseSuccessView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(.appPurchaseSuccess)
                .resizable()
                .frame(width: 278, height: 278)
            Text("Success! The payment went through Congratulations on your purchase!")
                .multilineTextAlignment(.center)
                .appTextStyleHeadline3()
        }
        .padding(.horizontal, 36)
    }
}

#Preview {
    PurchaseSuccessView()
}

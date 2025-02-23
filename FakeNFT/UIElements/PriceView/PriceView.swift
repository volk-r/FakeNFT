//
//  PriceView.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/23/25.
//

import SwiftUI

struct PriceView: View {
    let price: String
    
    var body: some View {
        Text(price)
            .appTextStyleBodyBold()
    }
}

#Preview {
    PriceView(
        price: PriceFormatter(
            currencySymbol: "ETH"
        ).string(from: 1.78)
    )
}

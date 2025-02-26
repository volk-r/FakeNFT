//
//  PriceView.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/23/25.
//

import SwiftUI

struct PriceView: View {
    var formatter: Formatter = PriceFormatter
        .defaultEthPriceFormatter
    let price: Double
    
    var body: some View {
        Text(
            formatter.string(for: price) ?? ""
        )
        .appTextStyleBodyBold()
    }
}

#Preview {
    PriceView(price: 1.78)
    PriceView(
        formatter: PriceFormatter(
            currencySymbol: "BTC"
        ),
        price: 1.78
    )
}

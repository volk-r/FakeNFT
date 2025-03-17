//
//  CartErrorView.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/2/25.
//

import SwiftUI

struct CartErrorView: View {
    var body: some View {
        Text("Error loading cart")
            .appTextStyleBodyBold(withColor: .appRedUniversal)
    }
}

#Preview {
    CartErrorView()
}

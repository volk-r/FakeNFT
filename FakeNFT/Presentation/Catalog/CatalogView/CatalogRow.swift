//
//  CatalogRow.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 23.02.2025.
//

import SwiftUI

struct CatalogRow: View {
    let collection: NFTCollection
    
    private var title: String {
        "\(collection.name.capitalized) (\(collection.nfts.count))"
    }
    
    var body: some View {
        Text(verbatim: title)
            .appTextStyleBodyBold()
    }
}

#Preview {
    HStack {
        CatalogRow(collection: NFTCollection.mock1)
        Spacer()
    }
    .padding(.horizontal, 16)
}

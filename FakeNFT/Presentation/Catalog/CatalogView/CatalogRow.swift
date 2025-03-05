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
        VStack(alignment: .leading, spacing: 4) {
            ImageLoaderFactory(url: collection.cover, contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 140)
                .cornerRadius(12)
            
            Text(verbatim: title)
                .appTextStyleBodyBold()
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    CatalogRow(collection: NFTCollection.mock1)
        .padding(.horizontal, 16)
}

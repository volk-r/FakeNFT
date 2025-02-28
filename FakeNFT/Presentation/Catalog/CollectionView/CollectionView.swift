//
//  CollectionView.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 28.02.2025.
//

import SwiftUI

struct CollectionView: View {
    @ObservedObject var viewModel: CollectionViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text(viewModel.collection.name.capitalized)
                .font(.largeTitle)
                .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
}

#Preview {
    CollectionView(viewModel: CollectionViewModel(collection: NFTCollection.mock1))
}

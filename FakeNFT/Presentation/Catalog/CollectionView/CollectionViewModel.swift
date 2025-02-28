//
//  CollectionViewModel.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 28.02.2025.
//

import SwiftUI

@Observable
@MainActor
final class CollectionViewModel: ObservableObject {
    let collection: NFTCollection

    init(collection: NFTCollection) {
        self.collection = collection
    }
}

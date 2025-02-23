//
//  NFTCardViewModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 23.02.2025.
//

import Foundation
import SwiftUI// TODO

@Observable
final class NFTCardViewModel {
    
    // MARK: - Properties
    
    var cardData: NFTModelMock = NFTModelMock(
        createdAt: "2023-04-20T02:22:27Z",
        name: "Lilo",
        images: [.nftCard1],
        rating: 3,
        description: "example: A 3D model of a mythical creature.",
        price: "8.81",
        author: "John Doe",
        id: "1"
    )
    
    // MARK: - Properties
    
    func likeAction(_ isLiked: Bool, for id: Int) {
        // TODO: - send put request
        var newLikeValue = isLiked
        newLikeValue.toggle()
        print("put request with \(newLikeValue.description) for id: \(id)")
    }
}

// TODO: - temporarily gag

struct NFTModelMock: Equatable, Identifiable {
    let createdAt: String
    let name: String
    let images: [ImageResource]
    let rating: Int
    let description: String
    let price: String
    let author: String
    let id: String
}

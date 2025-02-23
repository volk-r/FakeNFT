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
    
    var cardData: NFTModel = NFTModel(
        createdAt: "2023-10-08T07:43:22.944Z[GMT]",
        name: "Rosario Dejesus",
        images: [
            "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Finn/1.png",
            "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Finn/2.png",
            "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Finn/3.png"
        ],
        rating: 3,
        description: "explicari lobortis rutrum evertitur fugit convenire ligula",
        price: 28.27,
        author: "https://unruffled_cohen.fakenfts.org/",
        id: "7773e33c-ec15-4230-a102-92426a3a6d5a"
    )
    
    // MARK: - Properties
    
    func likeAction(_ isLiked: Binding<Bool>, for id: String) {
        // TODO: - send put request
        isLiked.wrappedValue.toggle()
        print("put request with \(isLiked.wrappedValue) for id: \(id)")
    }
}

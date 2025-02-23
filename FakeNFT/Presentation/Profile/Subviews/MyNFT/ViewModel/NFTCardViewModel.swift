//
//  NFTCardViewModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 23.02.2025.
//

import Foundation

@Observable
final class NFTCardViewModel {
    
    // MARK: - Properties
    
    var isLiked: Bool = false
    
    // MARK: - changeLike
    
    func likeToggle(for id: String) {
        isLiked.toggle()
        print("put request with \(isLiked.description) for id: \(id)")
    }
    
    // MARK: - setIsLiked
    
    func setIsLiked(_ isLiked: Bool) {
        self.isLiked = isLiked
    }
}

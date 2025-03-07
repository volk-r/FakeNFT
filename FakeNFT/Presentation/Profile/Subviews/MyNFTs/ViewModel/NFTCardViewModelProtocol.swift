//
//  NFTCardViewModelProtocol.swift
//  FakeNFT
//
//  Created by Roman Romanov on 24.02.2025.
//

import Foundation

protocol NFTCardViewModelProtocol {
    var isLiked: Bool { get }
    func likeToggle(for id: String)
    func setIsLiked(_ isLiked: Bool)
}

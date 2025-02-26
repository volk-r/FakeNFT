//
//  FavoriteNFTsViewModelProtocol.swift
//  FakeNFT
//
//  Created by Roman Romanov on 26.02.2025.
//

import Foundation

protocol FavoriteNFTsViewModelProtocol {
    var favoriteNFTsData: [NFTModel] { get }
    func fetchNFTData(likeIDs: [String]?)
    func fetchMockNFTData()
}

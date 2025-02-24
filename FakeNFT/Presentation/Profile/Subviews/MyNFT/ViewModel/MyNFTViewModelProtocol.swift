//
//  MyNFTViewModelProtocol.swift
//  FakeNFT
//
//  Created by Roman Romanov on 24.02.2025.
//

import Foundation

protocol MyNFTViewModelProtocol: Observable {
    var nftsData: [NFTModel] { get set }
    var showingSortingDialog: Bool { get set }
    var sortType: NFTSortingType { get set }
    func loadPageSettings() async
    func fetchNFTData(nftIDs: [String]?)
    func fetchMockNFTData()
}

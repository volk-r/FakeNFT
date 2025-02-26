//
//  MyNFTViewModelProtocol.swift
//  FakeNFT
//
//  Created by Roman Romanov on 24.02.2025.
//

import Foundation

protocol MyNFTViewModelProtocol: AnyObject, Sendable {
    var nftsData: [NFTModel] { get }
    var showingSortingDialog: Bool { get set }
    var sortType: NFTSortingType { get }
    @MainActor
    func loadPageSettings() async
    func fetchNFTData(nftIDs: [String]?)
    func fetchMockNFTData()
    func setSorting(_ sortingType: NFTSortingType)
}

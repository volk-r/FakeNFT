//
//  MyNFTViewModelProtocol.swift
//  FakeNFT
//
//  Created by Roman Romanov on 24.02.2025.
//

import Foundation

@MainActor
protocol MyNFTViewModelProtocol: AnyObject, Sendable {
    var nftsData: [NFTModel] { get }
    var showingSortingDialog: Bool { get set }
    var loadingState: LoadingState { get }
    var isEmptyNFTs: Bool { get }
    var sortType: NFTSortingType { get }
    func fetchNFTData(nftIDs: [String]?) async
    func fetchMockNFTData() async
    func setSorting(_ sortingType: NFTSortingType)
}

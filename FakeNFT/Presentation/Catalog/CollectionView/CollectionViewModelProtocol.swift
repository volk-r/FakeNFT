//
//  CollectionViewModelProtocol.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 02.03.2025.
//

import Foundation

@MainActor
protocol CollectionViewModelProtocol: ObservableObject {
    var collection: NFTCollection { get }
    var nftModels: [NFTModel] { get set }
    var loadingState: LoadingState { get set }
    func loadNFT() async
}

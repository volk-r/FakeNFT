//
//  ServicesAssembly.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//
import SwiftUI

final class ServicesAssembly: Sendable, Observable {

    private let networkClient: NetworkClient
    private let nftStorage: NftStorage

    init(
        networkClient: NetworkClient,
        nftStorage: NftStorage
    ) {
        self.networkClient = networkClient
        self.nftStorage = nftStorage
    }

    var nftService: NftService {
        NftServiceImpl(
            networkClient: networkClient,
            storage: nftStorage
        )
    }
    
    var nftCollectionService: NFTCollectionsServiceProtocol {
        NFTCollectionsService(networkClient: networkClient)
    }
}

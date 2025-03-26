//
//  NftStorageImpl.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//
import Foundation

// Пример простого класса, который сохраняет данные из сети
final actor NftStorageImpl: @preconcurrency NftStorage {
    private var storage: [String: Nft] = [:]

    func saveNft(_ nft: Nft) {
        storage[nft.id] = nft
    }

    func getNft(with id: String) -> Nft? {
            storage[id]
    }
}

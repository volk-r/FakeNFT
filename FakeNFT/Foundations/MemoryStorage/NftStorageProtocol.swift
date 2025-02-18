//
//  NftStorageProtocol.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//
import Foundation

protocol NftStorage: AnyObject, Sendable {
    func saveNft(_ nft: Nft)
    func getNft(with id: String) -> Nft?
}

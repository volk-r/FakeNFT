//
//  Nft.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//
import Foundation

struct Nft: Decodable {
    let id: String
    let images: [URL]
}

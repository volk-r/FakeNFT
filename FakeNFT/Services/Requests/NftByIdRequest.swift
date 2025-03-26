//
//  NftByIdRequest.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//
import Foundation

struct NFTRequest: NetworkRequest {
    let id: String
    var endpoint: URL? {
        URL(string: "\(GlobalConstants.baseURL)/api/v1/nft/\(id)")
    }
    var dto: Dto?
}

//
//  NFTCollectionsRequest.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 23.02.2025.
//

import Foundation

struct NFTCollectionsRequest: NetworkRequest {
    var endpoint: URL? {
        URL(string: "\(GlobalConstants.baseURL)/api/v1/collections")
    }
    var dto: (any Dto)?
}

//
//  OrderUpdateRequest.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 09.03.2025.
//

import Foundation

struct OrderUpdateRequest: NetworkRequest {
    let orderId: String
    let nfts: [String]
    
    var endpoint: URL? {
        URL(string: "\(GlobalConstants.baseURL)/api/v1/orders/\(orderId)")
    }
    
    var httpMethod: HttpMethod { .put }
    
    var dto: Dto? {
        OrderUpdateDto(nfts: nfts)
    }
}

struct OrderUpdateDto: Dto {
    let nfts: [String]
    
    func asDictionary() -> [String : String] {
        let joinedNfts = nfts.joined(separator: ",")
        return ["nfts": joinedNfts]
    }
}

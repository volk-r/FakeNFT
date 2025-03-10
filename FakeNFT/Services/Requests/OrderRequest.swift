//
//  OrderRequest.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 09.03.2025.
//

import Foundation

struct OrderRequest: NetworkRequest {
    let orderId: String
    
    var endpoint: URL? {
        URL(string: "\(GlobalConstants.baseURL)/api/v1/orders/\(orderId)")
    }
    
    var httpMethod: HttpMethod { .get }
    
    var dto: Dto? { nil }
}

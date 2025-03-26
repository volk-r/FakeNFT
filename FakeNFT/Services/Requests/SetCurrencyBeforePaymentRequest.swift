//
//  SetCurrencyBeforePaymentRequest.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/15/25.
//

import Foundation

struct SetCurrencyBeforePaymentRequest: NetworkRequest {
    let orderId: String
    let currencyId: String
    
    var endpoint: URL? {
        URL(string: "\(GlobalConstants.baseURL)/api/v1/orders/\(orderId)/payment/\(currencyId)")
    }
    var dto: Dto?
}

struct SetCurrencyBeforePaymentResponse: Decodable {
    let id: String
    let orderId: String
}

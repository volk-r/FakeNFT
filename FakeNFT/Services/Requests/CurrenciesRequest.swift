//
//  CurrenciesRequest.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/15/25.
//

import Foundation

struct CurrenciesRequest: NetworkRequest {
    var endpoint: URL? {
        URL(string: "\(GlobalConstants.baseURL)/api/v1/currencies")
    }
    var dto: (any Dto)?
}

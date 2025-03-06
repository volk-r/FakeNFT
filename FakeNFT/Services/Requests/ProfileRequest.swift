//
//  ProfileRequest.swift
//  FakeNFT
//
//  Created by Roman Romanov on 05.03.2025.
//

import Foundation

struct ProfileRequest: NetworkRequest {
    let id: String
    var endpoint: URL? {
        URL(string: "\(GlobalConstants.baseURL)/api/v1/profile/\(id)")
    }
    var dto: Dto?
}

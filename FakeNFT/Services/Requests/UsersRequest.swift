//
//  UsersRequest.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 24.02.2025.
//

import Foundation

struct UsersRequest: NetworkRequest {
    let page: Int
    let size: Int
    let sortBy: UsersSortType
    var endpoint: URL? {
        URL(string: "\(GlobalConstants.baseURL)/api/v1/users?page=\(page)&size=\(size)&sortBy=\(sortBy.rawValue)")
    }
    var dto: Dto?
}

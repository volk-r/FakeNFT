//
//  UsersCache.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 25.02.2025.
//

struct UsersCache: Sendable {
    let page: Int
    let count: Int
    let sortBy: UsersSortType
    let users: [User]
}

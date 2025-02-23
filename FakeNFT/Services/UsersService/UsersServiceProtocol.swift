//
//  UsersServiceProtocol.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 23.02.2025.
//
import Foundation

protocol UsersServiceProtocol: Sendable {
    func loadUsers(fromPage page: Int, count: Int, sortBy: UsersSortType) async throws -> [User]
}

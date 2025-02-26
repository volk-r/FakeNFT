//
//  AppStorageManagerProtocol.swift
//  FakeNFT
//
//  Created by Roman Romanov on 24.02.2025.
//

import Foundation

protocol AppStorageManagerProtocol {
    func save<T: Codable & Sendable>(value: T, forKey key: AppStorageManagerKey) async
    func load<T: Codable & Sendable>(forKey key: AppStorageManagerKey, defaultValue: T) async -> T
    func remove(forKey key: AppStorageManagerKey) async
}

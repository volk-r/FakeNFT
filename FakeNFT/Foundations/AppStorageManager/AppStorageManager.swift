//
//  AppStorageManager.swift
//  FakeNFT
//
//  Created by Roman Romanov on 24.02.2025.
//

import SwiftUI

actor AppStorageManager: AppStorageManagerProtocol {
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func save<T: Codable & Sendable>(value: T, forKey key: AppStorageManagerKey) async {
        if let encoded = try? JSONEncoder().encode(value) {
            userDefaults.set(encoded, forKey: key.rawValue)
        }
    }
    
    func load<T: Codable & Sendable>(forKey key: AppStorageManagerKey, defaultValue: T) async -> T {
        if let data = userDefaults.data(forKey: key.rawValue),
           let decoded = try? JSONDecoder().decode(T.self, from: data) {
            return decoded
        }
        return defaultValue
    }
    
    func remove(forKey key: AppStorageManagerKey) async {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}

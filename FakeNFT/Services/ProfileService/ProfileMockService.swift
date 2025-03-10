//
//  ProfileMockService.swift
//  FakeNFT
//
//  Created by Roman Romanov on 05.03.2025.
//

import Foundation

actor ProfileMockService: ProfileServiceProtocol {
    
    func clearCache() async {
    }
    
    func reloadProfile(for profileId: String) async throws -> ProfileModel? {
        return try await loadProfile(for: profileId)
    }
    
    func loadProfile(for profileId: String) async throws -> ProfileModel? {
        return ProfileModel.mockProfile
    }
    
    func updateLikes(for profileId: String, likes: [String]) async throws -> ProfileModel? {
        return ProfileModel.mockProfile
    }
}

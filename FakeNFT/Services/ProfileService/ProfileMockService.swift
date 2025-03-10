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
        print("reloadProfile", profileId)
        return try await loadProfile(for: profileId)
    }
    
    func loadProfile(for profileId: String) async throws -> ProfileModel? {
        print("loadProfile", profileId)
        return ProfileModel.mockProfile
    }
    
    func updateLikes(for profileId: String, likes: [String]) async throws -> ProfileModel? {
        print("updateLikes", profileId, likes)
        return ProfileModel.mockProfile
    }
    
    func updateProfile(for profileId: String, with profile: ProfileModel) async throws -> ProfileModel? {
        print("updateProfile", profileId, profile)
        return ProfileModel.mockProfile
    }
}

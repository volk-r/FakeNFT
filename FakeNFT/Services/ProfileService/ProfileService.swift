//
//  ProfileService.swift
//  FakeNFT
//
//  Created by Roman Romanov on 05.03.2025.
//

import Foundation

actor ProfileService: ProfileServiceProtocol {
    
    // MARK: - Properties
    
    private var cache: [String: ProfileModel] = [:]
    private let networkService: NetworkServiceProtocol
    private var activeDownloads: [String: Task<ProfileModel?, Error>] = [:]
    private var activeUpdates: [String: Task<ProfileModel?, Error>] = [:]
    
    // MARK: - Init

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: - clearCache

    func clearCache() async {
        cache = [:]
    }
    
    // MARK: - reloadProfile
    
    func reloadProfile(for profileId: String) async throws -> ProfileModel? {
        cache.removeValue(forKey: profileId)
        return try await loadProfile(for: profileId)
    }
    
    // MARK: - loadProfile
    
    func loadProfile(for profileId: String) async throws -> ProfileModel? {
        if let profileInfo = cache[profileId] {
            return profileInfo
        }
        
        if let existingDownload = activeDownloads[profileId] {
            return try await existingDownload.value
        }
        
        let downloadTask = Task<ProfileModel?, Error> { [weak self] in
            let request = ProfileRequest(id: profileId)
            return try await self?.networkService.send(request: request)
        }

        activeDownloads[profileId] = downloadTask
        let profileInfo = try await downloadTask.value
        
        if let profileInfo = profileInfo {
            cache[profileId] = profileInfo
        }
        
        activeDownloads.removeValue(forKey: profileId)
        
        return profileInfo
    }
    
    // MARK: - updateLikes
    
    func updateLikes(for profileId: String, likes: [String]) async throws -> ProfileModel? {
        let request = ProfileUpdateLikesRequest(id: profileId, likes: likes)
        let updatedProfile: ProfileModel? = try await networkService.send(request: request)
        if let updatedProfile = updatedProfile {
            cache[profileId] = updatedProfile
        }
        return updatedProfile
    }
    
    // MARK: - updateProfile
    
    func updateProfile(for profileId: String, with profile: ProfileModel) async throws -> ProfileModel? {
        if let existingUpdate = activeUpdates[profileId] {
            return try await existingUpdate.value
        }
        
        let updateTask = Task<ProfileModel?, Error> { [weak self] in
            let request = ProfileUpdateRequest(id: profileId, profile: profile)
            return try await self?.networkService.send(request: request)
        }

        activeUpdates[profileId] = updateTask
        let updatedProfileInfo = try await updateTask.value
        
        if let updatedProfileInfo = updatedProfileInfo {
            cache[profileId] = updatedProfileInfo
        }
        
        activeUpdates.removeValue(forKey: profileId)
        
        return updatedProfileInfo
    }
}

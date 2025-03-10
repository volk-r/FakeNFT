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
}

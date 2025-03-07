//
//  ProfileManager.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 07.03.2025.
//

import Foundation

@MainActor
@Observable
final class ProfileManager: ObservableObject {
    private(set) var likes: Set<String> = []
    private var profile: ProfileModel?
    
    private let profileService: ProfileService
    
    init(profileService: ProfileService = ProfileService()) {
        self.profileService = profileService
    }
    
    func loadProfile(for profileId: String) async {
        do {
            if let loadedProfile = try await profileService.loadProfile(for: profileId) {
                self.profile = loadedProfile
                self.likes = Set(loadedProfile.likes ?? [])
                print("DEBUG - Load Profile")
            }
        } catch {
            print("Error loading profile: \(error)")
        }
    }
    
    func toggleLike(for nftId: String) async {
        let profileId = GlobalConstants.mockProfileID
        
        if likes.contains(nftId) {
            likes.remove(nftId)
        } else {
            likes.insert(nftId)
        }
        
        do {
            if let updatedProfile = try await profileService.updateLikes(for: profileId, likes: Array(likes)) {
                self.profile = updatedProfile
                self.likes = Set(updatedProfile.likes ?? [])
            }
        } catch {
            print("Failed to update likes: \(error)")
        }
    }
    
    func isLiked(nftId: String) -> Bool {
        likes.contains(nftId)
    }
}

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
    
    // MARK: - Properties
    
    private let profileService: ProfileServiceProtocol
    private var profile: ProfileModel?
    private var isLikeRequestInProcess = false
    
    var likeIsDisabled: Bool {
        isLikeRequestInProcess || profile == nil
    }
    
    // MARK: - Initialization
    
    init(profileService: ProfileService = ProfileService()) {
        self.profileService = profileService
    }
    
    // MARK: - Public Methods
    
    func loadProfile(for profileId: String) async {
        do {
            if let loadedProfile = try await profileService.loadProfile(for: profileId) {
                self.profile = loadedProfile
            }
        } catch {
            print("Error loading profile: \(error)")
        }
    }
    
    func toggleLike(for nftId: String) async {
        guard let profile else {
            print("No profile loaded; cannot toggle like.")
            return
        }
        
        guard !isLikeRequestInProcess else {
            print("A like request is already in process. Ignoring.")
            return
        }
        isLikeRequestInProcess = true
        defer { isLikeRequestInProcess = false }
        
        let likes = profile.likes ?? []
        let newLikes = likes.contains(nftId)
            ? likes.filter { $0 != nftId }
            : likes + [nftId]
        
        do {
            let profileId = GlobalConstants.mockProfileID
            if let updatedProfile = try await profileService.updateLikes(for: profileId, likes: newLikes ) {
                self.profile = updatedProfile
            }
        } catch {
            print("Failed to update likes: \(error)")
        }
    }
    
    func isLiked(nftId: String) -> Bool {
        profile?.likes?.contains(nftId) ?? false
    }
}

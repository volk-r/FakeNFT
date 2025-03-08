//
//  ProfileManager.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 07.03.2025.
//

import Foundation

@Observable
final class ProfileManager: ObservableObject, ProfileManagerProtocol {
    
    // MARK: - Properties
    
    private let profileService: ProfileServiceProtocol
    
    private(set) var profile: ProfileModel?
    private var isLikeRequestInProcess = false
    
    var likeIsDisabled: Bool {
        isLikeRequestInProcess || profile == nil
    }
    
    // MARK: - Initialization
    
    init(profileService: ProfileService = ProfileService()) {
        self.profileService = profileService
    }
    
    // MARK: - Public Methods
    
    func loadProfile(for profileId: String) async throws {
        do {
            if let loadedProfile = try await profileService.loadProfile(for: profileId) {
                self.profile = loadedProfile
            }
        } catch {
            throw ProfileManagerError.profileLoadingError
        }
    }
    
    func toggleLike(for nftId: String) async throws {
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
            // TODO: profile.id != id in query request api/v1/profile/{id}
            let profileId = GlobalConstants.mockProfileID
            if let updatedProfile = try await profileService.updateLikes(for: profileId, likes: newLikes ) {
                self.profile = updatedProfile
            }
        } catch {
            throw ProfileManagerError.updateLikesError
        }
    }
    
    func isLiked(nftId: String) -> Bool {
        profile?.likes?.contains(nftId) ?? false
    }
}

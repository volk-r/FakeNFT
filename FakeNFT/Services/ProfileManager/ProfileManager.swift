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
    // api bug workaround: response profile.id != id in query request api/v1/profile/{id}
    private var externalProfileId: String?
    
    var likeIsDisabled: Bool {
        isLikeRequestInProcess || profile == nil
    }
    
    // MARK: - Initialization
    
    init(profileService: ProfileServiceProtocol = ProfileService()) {
        self.profileService = profileService
    }
    
    // MARK: - loadProfile
    
    func loadProfile(for profileId: String) async throws {
        do {
            if let loadedProfile = try await profileService.loadProfile(for: profileId) {
                self.externalProfileId = profileId
                self.profile = loadedProfile
            }
        } catch {
            throw ProfileManagerError.profileLoadingError
        }
    }
    
    // MARK: - updateProfile
    
    func updateProfile(with newProfileInfo: ProfileModel) async throws {
        guard let profileId = self.externalProfileId else {
            print("No profile loaded; cannot update profile info")
            return
        }
        
        do {
            if let updatedProfile = try await profileService.updateProfile(for: profileId, with: newProfileInfo) {
                self.profile = updatedProfile
            }
        } catch {
            throw ProfileManagerError.updateProfileError
        }
    }
    
    // MARK: - toggleLike
    
    func toggleLike(for nftId: String) async throws {
        guard
            let profile,
            let profileId = self.externalProfileId
        else {
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
            if let updatedProfile = try await profileService.updateLikes(for: profileId, likes: newLikes ) {
                self.profile = updatedProfile
            }
        } catch {
            throw ProfileManagerError.updateLikesError
        }
    }
    
    // MARK: - isLiked
    
    func isLiked(nftId: String) -> Bool {
        profile?.likes?.contains(nftId) ?? false
    }
}

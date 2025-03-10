//
//  EditProfileViewModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 28.02.2025.
//

import Foundation

@Observable
final class EditProfileViewModel: EditProfileViewModelProtocol {
    
    // MARK: - Properties
    
    private(set) var avatarLink: String = ""
    
    var avatarLinkChangeable: String = ""
    var userName: String = ""
    var userDescription: String = ""
    var userWebsite: String = ""
    var showDialog: Bool = false
    var profile: ProfileModel?
    
    var profileUpdated: ProfileModel {
        ProfileModel(
            id: profile?.id,
            name: userName,
            avatar: avatarLink,
            description: userDescription,
            website: userWebsite,
            nfts: profile?.nfts
        )
    }
    
    // MARK: - setupProfile
    
    func setupProfile(_ profile: ProfileModel?) {
        guard let profile else { return }
        self.profile = profile
        avatarLink = profile.avatar ?? ""
        avatarLinkChangeable = avatarLink
        userName = profile.name ?? ""
        userDescription = profile.description ?? ""
        userWebsite = profile.website ?? ""
    }
    
    // MARK: - updateAvatarLink
    
    func updateAvatarLink(_ link: String) {
        guard !link.isEmpty else {
            avatarLinkChangeable = avatarLink
            return
        }
        avatarLink = link
    }
}

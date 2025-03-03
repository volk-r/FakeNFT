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
    
    // MARK: - setupProfile
    
    func setupProfile(_ profile: ProfileModel?) {
        avatarLink = profile?.avatar ?? ""
        avatarLinkChangeable = avatarLink
        userName = profile?.name ?? ""
        userDescription = profile?.description ?? ""
        userWebsite = URL(string: profile?.website ?? "")?.host(percentEncoded: true) ?? ""
    }
    
    // MARK: - updateAvatarLink
    
    func updateAvatarLink(_ link: String) {
        guard !link.isEmpty else {
            avatarLinkChangeable = avatarLink
            return
        }
        avatarLink = link
    }
    
    func updateProfile() {
        // TODO: save new data profile
        print("save new data profile")
    }
}

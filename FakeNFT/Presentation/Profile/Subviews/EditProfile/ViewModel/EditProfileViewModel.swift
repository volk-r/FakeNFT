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
    
    var avatarLink: String = ""
    var userName: String = ""
    var userDescription: String = ""
    var userWebsite: String = ""
    var showDialog: Bool = false
    
    // MARK: - setupProfile
    
    func setupProfile(_ profile: ProfileModel?) {
        avatarLink = profile?.avatar ?? ""
        userName = profile?.name ?? ""
        userDescription = profile?.description ?? ""
        userWebsite = URL(string: profile?.website ?? "")?.host(percentEncoded: true) ?? ""
    }
    
    // MARK: - updateAvatarLink
    
    func updateAvatarLink(_ link: String) {
        guard link.isEmpty == false else { return }
        avatarLink = link
    }
    
    func updateProfile() {
        // TODO: save new data profile
        print("save new data profile")
    }
}

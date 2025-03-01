//
//  EditProfileViewModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 28.02.2025.
//

import Foundation

protocol EditProfileViewModelProtocol {
}

@Observable
final class EditProfileViewModel: EditProfileViewModelProtocol {
    
    var userName: String = ""
    var userDescription: String = ""
    var userWebsite: String = ""
    
    func setupProfile(_ profile: ProfileModel?) {
        userName = profile?.name ?? ""
        userDescription = profile?.description ?? ""
        userWebsite = URL(string: profile?.website ?? "")?.host(percentEncoded: true) ?? ""
    }
}

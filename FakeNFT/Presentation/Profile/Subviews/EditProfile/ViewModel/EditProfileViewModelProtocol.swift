//
//  EditProfileViewModelProtocol.swift
//  FakeNFT
//
//  Created by Roman Romanov on 01.03.2025.
//

import Foundation

protocol EditProfileViewModelProtocol {
    var avatarLink: String { get set }
    var userName: String { get set }
    var userDescription: String { get set }
    var userWebsite: String { get set }
    var showDialog: Bool { get set }
    func setupProfile(_ profile: ProfileModel?)
    func updateAvatarLink(_ link: String)
    func updateProfile()
}

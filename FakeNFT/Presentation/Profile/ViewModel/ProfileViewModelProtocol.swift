//
//  ProfileViewModelProtocol.swift
//  FakeNFT
//
//  Created by Roman Romanov on 24.02.2025.
//

import Foundation

protocol ProfileViewModelProtocol: Observable, AnyObject {
    var isMyNFTPresented: Bool { get set }
    var isFavoriteNFTsPresented: Bool { get set }
    var isDeveloperInfoPresented: Bool { get set }
    var isEditProfilePresented: Bool { get set }
    var profile: ProfileModel? { get }
    func loadProfile()
    func getMyNFTsCount() -> Int
    func getFavoriteNFTsCount() -> Int
    func loadMockProfile()
}

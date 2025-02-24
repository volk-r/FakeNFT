//
//  ProfileViewModelProtocol.swift
//  FakeNFT
//
//  Created by Roman Romanov on 24.02.2025.
//

import Foundation

protocol ProfileViewModelProtocol: Observable, AnyObject {
    var isAboutPresented: Bool { get set }
    var isMyNFTPresented: Bool { get set }
    var profile: ProfileModel? { get set }
    func loadProfile()
    func loadMockProfile()
}

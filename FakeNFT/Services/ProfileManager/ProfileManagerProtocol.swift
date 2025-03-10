//
//  ProfileManagerProtocol.swift
//  FakeNFT
//
//  Created by Roman Romanov on 08.03.2025.
//

import Foundation

@MainActor
protocol ProfileManagerProtocol {
    var profile: ProfileModel? { get }
    var likeIsDisabled: Bool { get }
    func reloadProfile() async throws
    func loadProfile(for profileId: String) async throws
    func toggleLike(for nftId: String) async throws
}

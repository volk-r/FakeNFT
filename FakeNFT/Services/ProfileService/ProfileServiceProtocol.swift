//
//  ProfileServiceProtocol.swift
//  FakeNFT
//
//  Created by Roman Romanov on 05.03.2025.
//

import Foundation

protocol ProfileServiceProtocol: Sendable {
    func clearCache() async
    func reloadProfile(for profileId: String) async throws -> ProfileModel?
    func loadProfile(for profileId: String) async throws -> ProfileModel?
    func updateLikes(for profileId: String, likes: [String]) async throws -> ProfileModel?
    func updateProfile(for profileId: String, with profile: ProfileModel) async throws -> ProfileModel?
}

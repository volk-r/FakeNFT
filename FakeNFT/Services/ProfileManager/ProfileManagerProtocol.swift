//
//  ProfileManagerProtocol.swift
//  FakeNFT
//
//  Created by Roman Romanov on 08.03.2025.
//

import Foundation

@MainActor
protocol ProfileManagerProtocol {
    var likeIsDisabled: Bool { get }
    func loadProfile(for profileId: String) async throws
    func toggleLike(for nftId: String) async throws
}

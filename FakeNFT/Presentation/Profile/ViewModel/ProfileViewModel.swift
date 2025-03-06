//
//  ProfileViewModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 20.02.2025.
//

import Foundation

@Observable
final class ProfileViewModel: ProfileViewModelProtocol {
    
    // MARK: - Properties
    
    private let profileService: ProfileServiceProtocol = ProfileService()
    
    private(set) var loadingState: LoadingState = .default
    
    var isMyNFTPresented: Bool = false
    var isFavoriteNFTsPresented: Bool = false
    var isDeveloperInfoPresented: Bool = false
    var isEditProfilePresented: Bool = false
    
    private(set) var profile: ProfileModel?
    
    // MARK: - loadProfile
    
    func loadProfile(for profileId: String) async {
        loadingState = .loading
        
        do {
            if ProcessInfo.processInfo.environment["USE_MOCK_DATA"] == "true" {
                loadMockProfile()
            }
            else {
                profile = try await profileService.loadProfile(for: profileId)
            }
            loadingState = .success
        } catch {
            loadingState = .failure
        }
    }
    
    // MARK: - getMyNFTsCount
    
    func getMyNFTsCount() -> Int {
        profile?.nfts?.count ?? 0
    }
    
    // MARK: - getFavoriteNFTsCount
    
    func getFavoriteNFTsCount() -> Int {
        profile?.likes?.count ?? 0
    }
    
    // MARK: - loadMockProfile
    
    func loadMockProfile() {
        profile = ProfileModel.mockProfile
    }
}

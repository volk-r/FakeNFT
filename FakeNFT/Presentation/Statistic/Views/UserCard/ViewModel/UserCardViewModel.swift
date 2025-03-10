//
//  UserCardViewModel.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 28.02.2025.
//

import SwiftUI

@Observable
@MainActor
final class UserCardViewModel: UserCardViewModelProtocol {
    // MARK: - Public Methods
    
    func showUsersWebSite(withAddress website: String, in navigationPath: inout NavigationPath) {
        let usersWebSite = UserWebSite(website: website)
        navigationPath.append(usersWebSite)
    }

    func showUsersNFTCollection(withData userData: UserData, in navigationPath: inout NavigationPath) {
        let userData = userData
        navigationPath.append(userData)
    }
}

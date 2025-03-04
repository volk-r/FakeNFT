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

    func showUsersNFTCollection(withId id: String, in navigationPath: inout NavigationPath) {
        let usersId = UserId(id: id)
        navigationPath.append(usersId)
    }
}

//
//  UserCardViewModelProtocol.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 28.02.2025.
//

import SwiftUI

@MainActor
protocol UserCardViewModelProtocol: AnyObject, Sendable, Observable {
    func showUsersWebSite(withAddress website: String, in navigationPath: inout NavigationPath)
    func showUsersNFTCollection(withData userData: UserData, in navigationPath: inout NavigationPath)
}

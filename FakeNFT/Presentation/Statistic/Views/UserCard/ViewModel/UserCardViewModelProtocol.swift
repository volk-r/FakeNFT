//
//  UserCardViewModelProtocol.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 28.02.2025.
//

import SwiftUI

@MainActor
protocol UserCardViewModelProtocol: AnyObject, Sendable, Observable {
    func showUsersWebSite(withAddress website: String, in navigationPath: Binding<NavigationPath>)
    func showUsersNFTCollection(withId id: String, in navigationPath: Binding<NavigationPath>)
}

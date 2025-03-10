//
//  FakeNFTApp.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//

import SwiftUI

@main
struct FakeNFTApp: App {
    @StateObject private var profileManager = ProfileManager()
    @StateObject private var orderManager = OrderManager()
    
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environmentObject(profileManager)
                .environmentObject(orderManager)
                .task {
                    try? await profileManager.loadProfile(for: GlobalConstants.mockProfileID)
                    try? await orderManager.loadOrder()
                }
        }
    }
}

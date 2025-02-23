//
//  FakeNFTApp.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//

import SwiftUI

@main
struct FakeNFTApp: App {
    let servicesAssembly = ServicesAssembly(
        networkClient: DefaultNetworkClient(),
        nftStorage: NftStorageImpl()
    )

    var body: some Scene {
        WindowGroup {
            AppTabView(servicesAssembly: servicesAssembly)
                .environment(servicesAssembly)
        }
    }
}

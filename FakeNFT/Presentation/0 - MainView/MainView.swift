//
//  MainView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//

import SwiftUI

struct MainView: View {
    // MARK: - View

    var body: some View {
        TabView(selection: $selectedTabIndex) {
            ProfileView()
                .tabItem {
                    Image(selectedTabIndex == 0 ? "profileActive" : "profileNoActive")
                    Text("Profile")
                }
                .tag(0)
            CatalogView()
                .tabItem {
                    Image(selectedTabIndex == 1 ? "catalogActive" : "catalogNoActive")
                    Text("Catalog")
                }
                .tag(1)
            CartView()
                .tabItem {
                    Image(selectedTabIndex == 2 ? "cartActive" : "cartNoActive")
                    Text("Cart")
                }
                .tag(2)
            NavigationStack {
                StatisticView()
            }
            .tabItem {
                Image(selectedTabIndex == 3 ? "statisticActive" : "statisticNoActive")
                Text("Statistic")
            }
            .tag(3)
        }
    }

    // MARK: - Bindings

    @AppStorage("mainViewSelectedTabIndex") var selectedTabIndex: Int = 0
}

#Preview {
    MainView()
}

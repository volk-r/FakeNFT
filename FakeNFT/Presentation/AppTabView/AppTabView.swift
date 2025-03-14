//
//  AppTabView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//

import SwiftUI

struct AppTabView: View {
    @State var cartNavigationPath: [CartNavigationPath] = []
    @StateObject private var catalogViewModel: CatalogViewModel

    // MARK: - Initializers

    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .systemBackground
        appearance.shadowColor = .clear

        appearance.stackedLayoutAppearance.selected.iconColor = .systemBlue
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.systemBlue
        ]
        appearance.stackedLayoutAppearance.normal.iconColor = .appBlack
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.appBlack
        ]

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance

        _catalogViewModel = StateObject(wrappedValue: CatalogViewModel())
    }

    // MARK: - View

    var body: some View {
        TabView(selection: $selectedTabIndex) {
            ProfileView()
                .tabItem {
                    Image(uiImage: .tabProfile)
                    Text("Profile")
                }
                .tag(0)
            CatalogView(viewModel: catalogViewModel)
                .tabItem {
                    Image(uiImage: .tabCatalog)
                    Text("Catalog")
                }
                .tag(1)
            NavigationStack(path: $cartNavigationPath) {
                CartView(
                    viewModel: CartViewModel { path in
                        cartNavigationPath.append(path)
                    }
                )
                .navigationDestination(
                    for: CartNavigationPath.self
                ) { screen in
                    switch screen {
                    case .userAgreement:
                        WebView(navigationURL: "https://yandex.ru/legal/practicum_termsofuse")
                    case .purchase:
                        PurchaseView(
                            viewModel: PurchaseViewModel { path in
                                cartNavigationPath.append(path)
                            }
                        )
                    case .purchaseSuccess:
                        PurchaseSuccessView(
                            viewModel: PurchaseSuccessViewModel {
                                cartNavigationPath.removeAll()
                            }
                        )
                    }
                }
            }
            .tabItem {
                Image(uiImage: .tabCart)
                Text("Cart")
            }
            .tag(2)
            StatisticView()
                .tabItem {
                    Image(uiImage: .tabStatistics)
                    Text("Statistic")
                }
                .tag(3)
        }
    }

    // MARK: - Bindings

    @AppStorage("appTabViewSelectedTabIndex") var selectedTabIndex: Int = 0
}

#Preview {
    AppTabView()
}

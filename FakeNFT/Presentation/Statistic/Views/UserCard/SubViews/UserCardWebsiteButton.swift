//
//  UserCardWebsiteButton.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 02.03.2025.
//

import SwiftUI

struct UserCardWebsiteButton: View {
    // MARK: - Constants

    let user: User
    let viewModel: UserCardViewModelProtocol

    // MARK: - Bindings

    @Binding var navigationPath: NavigationPath

    // MARK: - View

    var body: some View {
        Button(
            action: {
                viewModel.showUsersWebSite(
                    withAddress: user.website,
                    in: $navigationPath
                )
            },
            label: {
                Text("userCardViewGoToUsersSiteButton")
                    .appTextStyleCaption1()
                    .frame(maxWidth: .infinity)
                    .padding([.vertical], Constants.usersSiteButtonTextVerticalPadding)
                    .overlay(
                        RoundedRectangle(cornerRadius: Constants.usersSiteButtonCornerRadius)
                            .stroke(
                                Constants.usersSiteButtonBorderColor,
                                lineWidth: Constants.usersSiteButtonBorderWidth
                            )
                    )
            }
        )
        .accessibilityIdentifier(StatisticUITestIdentifiers.userWebSiteButtonAccessibilityIdentifier)
        .padding([.top], Constants.usersSiteButtonTopPadding)
        .disabled(user.website.isEmpty)
    }
}

private extension UserCardWebsiteButton {
    // MARK: - Types

    private enum Constants {
        static let usersSiteButtonTextVerticalPadding: CGFloat = 10
        static let usersSiteButtonCornerRadius: CGFloat = 16
        static let usersSiteButtonBorderWidth: CGFloat = 1
        static let usersSiteButtonBorderColor: Color = .appBlack
        static let usersSiteButtonTopPadding: CGFloat = 28
    }
}

#Preview {
    @Previewable let user = User.getMockUserData()
    @Previewable @State var nav = NavigationPath()
    
    NavigationStack(path: $nav) {
        UserCardWebsiteButton(
            user: user,
            viewModel: UserCardViewModel(),
            navigationPath: $nav
        )
        .navigationDestination(for: UserWebSite.self) { userWebSite in
            WebView(navigationURL: userWebSite.website)
        }
    }
    .accentColor(.appBlack)
}

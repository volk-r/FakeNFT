//
//  UserCardNFTLink.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 02.03.2025.
//

import SwiftUI

struct UserCardNFTLink: View {
    // MARK: - Constants

    let user: User
    let viewModel: UserCardViewModelProtocol
    
    // MARK: - Bindings

    @Binding var navigationPath: NavigationPath

    // MARK: - View

    var body: some View {
        List {
            Button(
                action: {
                    viewModel.showUsersNFTCollection(
                        withData: UserData(
                            id: user.id,
                            nfts: user.nfts
                        ),
                        in: &navigationPath
                    )
                },
                label: {
                    HStack {
                        Text(
                            String(
                                format: String(localized: "usersCardViewNFTSCollectionCount"),
                                arguments: [user.nfts.count]
                            )
                        )
                        .appTextStyleBodyBold()
                        Spacer()
                        Image(systemName: GlobalConstants.chevronRightImageName)
                    }
                }
            )
            .listRowSeparator(.hidden)
            .listRowInsets(Constants.listEdgeInsets)
            .disabled(user.nfts.isEmpty)
        }
        .accessibilityIdentifier(StatisticUITestIdentifiers.nftsCollectionAccessibilityIdentifier)
        .padding([.top], Constants.listTopPadding)
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .padding(Constants.listEdgeInsets)
    }
}

private extension UserCardNFTLink {
    // MARK: - Types
    
    private enum Constants {
        static let listEdgeInsets = EdgeInsets(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        static let listTopPadding: CGFloat = 40
    }
}

#Preview {
    @Previewable let user = User.getMockUserData()
    @Previewable @State var nav = NavigationPath()
    
    NavigationStack(path: $nav) {
        UserCardNFTLink(
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

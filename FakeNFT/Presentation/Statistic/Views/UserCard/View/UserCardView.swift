//
//  UserCardView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 28.02.2025.
//

import SwiftUI

struct UserCardView: View {
    // MARK: - Types

    private enum Constants {
        static let userImageAccessibilityIdentifier = "userCardViewImage"
        static let userNameAccessibilityIdentifier = "userCardViewName"
        static let userWebSiteButtonAccessibilityIdentifier = "userCardViewWebSiteButton"
        static let nftsCollectionAccessibilityIdentifier = "userCardViewNFTsCollectionList"
        static let defaultForegroundColor: Color = .appBlack
        static let panelsTopPadding: CGFloat = 20
        static let panelsHorizontalPadding: CGFloat = 16
        static let usersNameHorizontalSpacing: CGFloat = 16
        static let usersPictureSize: CGFloat = 70
        static let userNameLineLimit: Int = 2
        static let usersDescriptionTopPadding: CGFloat = 20
        static let usersSiteButtonTextVerticalPadding: CGFloat = 10
        static let usersSiteButtonCornerRadius: CGFloat = 16
        static let usersSiteButtonBorderWidth: CGFloat = 1
        static let usersSiteButtonBorderColor: Color = .appBlack
        static let usersSiteButtonTopPadding: CGFloat = 28
        static let listEdgeInsets = EdgeInsets(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        static let listTopPadding: CGFloat = 40
    }

    // MARK: - Constants

    let user: User

    // MARK: - State

    @State private var viewModel: UserCardViewModelProtocol

    // MARK: - Binding

    @Environment(\.dismiss) var dismiss
    @Binding var navigationPath: NavigationPath

    // MARK: - Initializers

    init(
        user: User,
        navigationPath: Binding<NavigationPath>,
        viewModel: UserCardViewModelProtocol = UserCardViewModel()
    ) {
        self.user = user
        self._navigationPath = navigationPath
        self.viewModel = viewModel
    }

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: Constants.usersNameHorizontalSpacing) {
                ImageLoaderFactory(
                    url: user.avatar,
                    contentMode: .fill,
                    placeholder: Image(uiImage: GlobalConstants.userPictureStub),
                    isShowActivityIndicator: true
                )
                .frame(width: Constants.usersPictureSize, height: Constants.usersPictureSize)
                .clipShape(Circle())
                .accessibilityIdentifier(Constants.userImageAccessibilityIdentifier)
                Text(user.name)
                    .appTextStyleHeadline3()
                    .lineLimit(Constants.userNameLineLimit)
                    .accessibilityIdentifier(Constants.userNameAccessibilityIdentifier)
                Spacer()
            }
            if let userDescription = user.description {
                Text(userDescription)
                    .appTextStyleCaption2()
                    .padding([.top], Constants.usersDescriptionTopPadding)
            }
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
            .accessibilityIdentifier(Constants.userWebSiteButtonAccessibilityIdentifier)
            .padding([.top], Constants.usersSiteButtonTopPadding)
            .disabled(user.website.isEmpty)
            List {
                Button(
                    action: {
                        viewModel.showUsersNFTCollection(
                            withId: user.id,
                            in: $navigationPath
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
            .accessibilityIdentifier(Constants.nftsCollectionAccessibilityIdentifier)
            .padding([.top], Constants.listTopPadding)
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .padding(Constants.listEdgeInsets)
        }
        .padding([.horizontal], Constants.panelsHorizontalPadding)
        .padding([.top], Constants.panelsTopPadding)
        Spacer()
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: dismissView) {
                        Image(systemName: GlobalConstants.chevronLeftImageName)
                            .imageScale(.large)
                    }
                }
            }
            .foregroundStyle(Constants.defaultForegroundColor)
            .toolbar(.hidden, for: .tabBar)
    }

    // MARK: - Private Methods

    private func dismissView() {
        dismiss()
    }
}

#Preview {
    @Previewable @State var user = User.getMockUserData()
    @Previewable @State var navigationPath = NavigationPath()
    NavigationStack {
        UserCardView(user: user, navigationPath: $navigationPath)
            .navigationDestination(for: UserWebSite.self) { userWebSite in
                WebView(navigationURL: userWebSite.website)
            }
            .navigationDestination(for: UserId.self) { _ in
                Text("Hello, world!")
            }
    }
}

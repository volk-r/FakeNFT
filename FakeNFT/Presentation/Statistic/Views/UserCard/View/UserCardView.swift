//
//  UserCardView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 28.02.2025.
//

import SwiftUI

struct UserCardView: View {
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
            UserCardHeaderView(user: user)
            UserCardWebsiteButton(
                user: user,
                viewModel: viewModel,
                navigationPath: $navigationPath
            )
            UserCardNFTLink(user: user,
                            viewModel: viewModel,
                            navigationPath: $navigationPath)
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

extension UserCardView {
    // MARK: - Types

    private enum Constants {
        static let defaultForegroundColor: Color = .appBlack
        static let panelsTopPadding: CGFloat = 20
        static let panelsHorizontalPadding: CGFloat = 16
    }
}

#Preview {
    @Previewable @State var user = User.getMockUserData()
    @Previewable @State var navigationPath = NavigationPath()
    NavigationStack(path: $navigationPath) {
        UserCardView(user: user, navigationPath: $navigationPath)
            .navigationDestination(for: UserWebSite.self) { userWebSite in
                WebView(navigationURL: userWebSite.website)
            }
            .navigationDestination(for: UserId.self) { _ in
                Text("\(user.id)")
            }
    }
    .accentColor(.appBlack)
}

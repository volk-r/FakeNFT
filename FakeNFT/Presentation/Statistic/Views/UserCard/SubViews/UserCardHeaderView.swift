//
//  UserCardHeaderView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 02.03.2025.
//

import SwiftUI

struct UserCardHeaderView: View {
    // MARK: - Constants

    let user: User

    // MARK: - View

    var body: some View {
        HStack(alignment: .center, spacing: Constants.usersNameHorizontalSpacing) {
            ImageLoaderFactory(
                url: user.avatar,
                contentMode: .fill,
                placeholder: Image(uiImage: GlobalConstants.userPictureStub),
                isShowActivityIndicator: true
            )
            .frame(width: Constants.usersPictureSize, height: Constants.usersPictureSize)
            .clipShape(Circle())
            .accessibilityIdentifier(StatisticUITestIdentifiers.userImageAccessibilityIdentifier)
            Text(user.name)
                .appTextStyleHeadline3()
                .lineLimit(Constants.userNameLineLimit)
                .accessibilityIdentifier(StatisticUITestIdentifiers.userNameAccessibilityIdentifier)
            Spacer()
        }
        if let userDescription = user.description {
            Text(userDescription)
                .appTextStyleCaption2()
                .padding(.top, Constants.usersDescriptionTopPadding)
        }
    }
}

private extension UserCardHeaderView {
    // MARK: - Types

    private enum Constants {
        static let usersNameHorizontalSpacing: CGFloat = 16
        static let usersPictureSize: CGFloat = 70
        static let userNameLineLimit: Int = 2
        static let usersDescriptionTopPadding: CGFloat = 20
    }
}

#Preview {
    @Previewable let user = User.getMockUserData()
    UserCardHeaderView(user: user)
}

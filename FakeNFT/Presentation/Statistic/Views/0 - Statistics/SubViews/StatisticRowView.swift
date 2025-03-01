//
//  StatisticRowView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 22.02.2025.
//

import SwiftUI

struct StatisticRowView: View {
    // MARK: - Types

    private enum Constants {
        static let statisticRowHeight: CGFloat = 80
        static let ratingWidth: CGFloat = 20
        static let ratingTrailingPadding: CGFloat = 8
        static let imageSize: CGFloat = 28
        static let imageLeadingPadding: CGFloat = 16
        static let userNameLineLimit: Int = 2
        static let userNameLeadingPadding: CGFloat = 8
        static let nftsCountHorizontalPadding: CGFloat = 16
        static let usersDataPanelCornerRadius: CGFloat = 12
        static let usersDataPanelBackgroundColor: Color = .appLightGray
    }

    // MARK: - Constants

    let user: User

    // MARK: - View

    var body: some View {
        HStack(alignment: .center, spacing: Constants.ratingTrailingPadding) {
            Text(user.rating)
                .appTextStyleCaption1()
                .frame(width: Constants.ratingWidth)

            HStack(alignment: .center, spacing: 0) {
                ImageLoaderFactory(
                    url: user.avatar,
                    contentMode: .fill,
                    placeholder: Image(uiImage: GlobalConstants.userPictureStub),
                    isShowActivityIndicator: true
                )
                .frame(width: Constants.imageSize, height: Constants.imageSize)
                .clipShape(RoundedRectangle(cornerRadius: Constants.imageSize))
                .padding(.leading, Constants.imageLeadingPadding)

                Text(user.name)
                    .appTextStyleHeadline3()
                    .padding(.leading, Constants.userNameLeadingPadding)

                Spacer()

                Text(user.nfts.count.formatted(.number.locale(Locale.current)))
                    .appTextStyleHeadline3()
                    .padding(.horizontal, Constants.nftsCountHorizontalPadding)
            }
            .frame(height: Constants.statisticRowHeight)
            .background(in: RoundedRectangle(cornerRadius: Constants.usersDataPanelCornerRadius))
            .backgroundStyle(Constants.usersDataPanelBackgroundColor)
        }
    }
}

#Preview {
    StatisticRowView(user: User.getMockUserData())
}

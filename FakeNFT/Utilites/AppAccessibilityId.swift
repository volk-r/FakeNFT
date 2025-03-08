//
//  AppAccessibilityId.swift
//  FakeNFT
//
//  Created by Roman Romanov on 06.03.2025.
//

import Foundation

enum AppAccessibilityId {
    enum Profile {
        static let webView = "accessibilityIdentifiersProfileWebView"
        static let myNFT = "accessibilityIdentifiersProfileMyNFT"
        static let favoriteNFTs = "accessibilityIdentifiersProfileFavoriteNFTs"
        static let developerInfo = "accessibilityIdentifiersProfileDeveloperInfo"
    }

    enum WebView {
        static let message = "accessibilityIdentifiersWebViewMessage"
        static let image = "accessibilityIdentifiersWebViewImage"
        static let progressView = "accessibilityIdentifiersProgress"
    }

    enum StatisticView {
        static let list = "statisticsList"
    }

    enum UserCardView {
        static let userImage = "userCardViewImage"
        static let userName = "userCardViewName"
        static let nftsCollection = "userCardViewNFTsCollectionList"
        static let userWebSiteButton = "userCardViewWebSiteButton"
    }

    enum UsersCollectionView {
        static let list = "usersCollectionViewNFTsList"
    }
}

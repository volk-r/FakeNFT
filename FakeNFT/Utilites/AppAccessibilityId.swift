//
//  AppAccessibilityId.swift
//  FakeNFT
//
//  Created by Roman Romanov on 06.03.2025.
//

import Foundation

enum AppAccessibilityId {
    enum Profile {
        static let editButton = "accessibilityIdentifiersProfileEditButton"
        static let name = "accessibilityIdentifiersProfileName"
        static let webView = "accessibilityIdentifiersProfileWebView"
        static let myNFTs = "accessibilityIdentifiersProfileMyNFT"
        static let favoriteNFTs = "accessibilityIdentifiersProfileFavoriteNFTs"
        static let developerInfo = "accessibilityIdentifiersProfileDeveloperInfo"
    }
    
    enum EditProfile {
        static let avatarChangeImage = "accessibilityIdentifiersEditProfileAvatarChangeImage"
    }
    
    enum MyNFTs {
        static let noNFTs = "accessibilityIdentifiersMyNFTsNoNFTs"
    }
    
    enum FavoriteNFTs {
        static let noNFTs = "accessibilityIdentifiersFavoriteNFTsNoNFTs"
    }
    
    enum NFTCard {
        static let likeImage = "accessibilityIdentifiersNFTCardLikeImage"
        static let description = "accessibilityIdentifiersNFTCardDescription"
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

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
        static let myNFT = "accessibilityIdentifiersProfileMyNFT"
        static let favoriteNFTs = "accessibilityIdentifiersProfileFavoriteNFTs"
        static let developerInfo = "accessibilityIdentifiersProfileDeveloperInfo"
    }
    
    enum EditProfile {
        static let avatarChangeImage = "accessibilityIdentifiersEditProfileAvatarChangeImage"
    }
    
    enum NFTCard {
        static let likeImage = "accessibilityIdentifiersNFTCardLikeImage"
        static let description = "accessibilityIdentifiersNFTCardDescription"
    }
    
    enum WebView {
        static let message = "accessibilityIdentifiersWebViewMessage"
        static let image = "accessibilityIdentifiersWebViewImage"
    }
}

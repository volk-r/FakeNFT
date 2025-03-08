//
//  UserCardViewScreen.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 01.03.2025.
//

import XCTest
@testable import FakeNFT

struct UserCardViewScreen {
    // MARK: - Constants

    let application: XCUIApplication

    // MARK: - Public Methods

    func checkControlsExist() -> Self {
        let userImage = userImageElement()
        XCTAssertTrue(userImage.exists)
        let userName = userNameElement()
        XCTAssertTrue(userName.exists)
        let userWebSiteButton = userWebSiteButtonElement()
        XCTAssertTrue(userWebSiteButton.exists)
        let nftsCollection = nftsCollectionElement()
        XCTAssertTrue(nftsCollection.exists)
        let nftsCollectionCell = nftsCollectionCellElement()
        XCTAssertTrue(nftsCollectionCell.exists)
        return self
    }

    func checkUsersWebSiteButton() -> Self {
        let userWebSiteButton = userWebSiteButtonElement()
        XCTAssertTrue(userWebSiteButton.exists)
        userWebSiteButton.tap()
        let webViewProgressView = webViewProgressViewElement()
        XCTAssertTrue(webViewProgressView.exists)
        return self
    }
    
    // MARK: - Private Methods

    private func userImageElement() -> XCUIElement {
        return application.images.element(
            matching: NSPredicate(
                format: "identifier == '\(AppAccessibilityId.UserCardView.userImage)'"
            )
        )
    }

    private func userNameElement() -> XCUIElement {
        return application.staticTexts.element(matching: NSPredicate(format: "identifier == '\(AppAccessibilityId.UserCardView.userName)'"))
    }

    private func userWebSiteButtonElement() -> XCUIElement {
        return application.buttons.element(
            matching: NSPredicate(
                format: "identifier == '\(AppAccessibilityId.UserCardView.userWebSiteButton)'"
            )
        )
    }

    private func nftsCollectionElement() -> XCUIElement {
        return application.collectionViews.element(
            matching: NSPredicate(
                format: "identifier == '\(AppAccessibilityId.UserCardView.nftsCollection)'"
            )
        )
    }

    private func nftsCollectionCellElement() -> XCUIElement {
        return nftsCollectionElement().cells.element(boundBy: 0)
    }

    private func webViewProgressViewElement() -> XCUIElement {
        return application.progressIndicators.element(matching: NSPredicate(format: "identifier == '\(AppAccessibilityId.WebView.progressView)'"))
    }
}

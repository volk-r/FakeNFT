//
//  EmptyProfileUITests.swift
//  FakeNFTUITests
//
//  Created by Roman Romanov on 09.03.2025.
//

import Foundation

import XCTest
@testable import FakeNFT

final class EmptyProfileUITests: XCTestCase {
    
    private var app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchEnvironment["USE_EMPTY_MOCK_DATA"] = "true"
        app.launch()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        app.terminate()
    }
    
    private func openProfileScreen() {
        let profileButton = app.tabBars.children(matching: .button).element(boundBy: 0)
        XCTAssertTrue(profileButton.exists)
        profileButton.tap()
    }
    
    func testMyNFTsEmpty() {
        openProfileScreen()
        let myNFTs = app.staticTexts[AppAccessibilityId.Profile.myNFTs]
        XCTAssertTrue(myNFTs.waitForExistence(timeout: 3))
        myNFTs.firstMatch.tap()
        XCTAssertTrue(app.staticTexts[AppAccessibilityId.MyNFTs.noNFTs].waitForExistence(timeout: 3))
    }
    
    func testFavoriteNFTsEmpty() {
        openProfileScreen()
        let favoriteNFTs = app.staticTexts[AppAccessibilityId.Profile.favoriteNFTs]
        XCTAssertTrue(favoriteNFTs.waitForExistence(timeout: 3))
        favoriteNFTs.firstMatch.tap()
        XCTAssertTrue(app.staticTexts[AppAccessibilityId.FavoriteNFTs.noNFTs].waitForExistence(timeout: 3))
    }
}

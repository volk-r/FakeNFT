//
//  ProfileUITests.swift
//  FakeNFTUITests
//
//  Created by Roman Romanov on 06.03.2025.
//

import XCTest
@testable import FakeNFT

final class ProfileUITests: XCTestCase {
    
    private var app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchEnvironment["USE_MOCK_DATA"] = "true"
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
    
    func testProfileElements() {
        openProfileScreen()
        let webView = app.buttons[AppAccessibilityId.Profile.webView]
        XCTAssertTrue(webView.waitForExistence(timeout: 3), "WebView not found")
        XCTAssertTrue(app.staticTexts[AppAccessibilityId.Profile.name].exists, "Name not found")
        XCTAssertTrue(app.buttons[AppAccessibilityId.Profile.editButton].exists, "Edit button not found")
        XCTAssertTrue(app.staticTexts[AppAccessibilityId.Profile.myNFT].exists, "My NFT not found")
        XCTAssertTrue(app.staticTexts[AppAccessibilityId.Profile.favoriteNFTs].exists, "Favorite NFTs not found")
        XCTAssertTrue(app.staticTexts[AppAccessibilityId.Profile.developerInfo].exists, "Developer info not found")
    }
    
    func testProfileWebView() {
        openProfileScreen()
        let webView = app.buttons[AppAccessibilityId.Profile.webView]
        XCTAssertTrue(webView.waitForExistence(timeout: 3))
        webView.tap()
        XCTAssertTrue(app.staticTexts[AppAccessibilityId.WebView.message].waitForExistence(timeout: 5))
        XCTAssertTrue(app.images[AppAccessibilityId.WebView.image].exists)
    }
}

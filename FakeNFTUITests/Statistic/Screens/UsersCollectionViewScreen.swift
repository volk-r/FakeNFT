//
//  UsersCollectionViewScreen.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 08.03.2025.
//

import XCTest
@testable import FakeNFT

struct UsersCollectionViewScreen {
    // MARK: - Constants
    
    let application: XCUIApplication
    
    // MARK: - Public Methods

    func checkControlsExist() -> Self {
        let nftList = listElement()
        XCTAssertTrue(nftList.exists)
        return self
    }

    // MARK: - Private Methods

    private func listElement() -> XCUIElement {
        return application.otherElements.element(matching: NSPredicate(format: "identifier == '\(AppAccessibilityId.UsersCollectionView.list)'"))
    }
}

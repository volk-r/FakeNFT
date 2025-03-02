//
//  StatisticViewScreen.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 01.03.2025.
//

import XCTest

struct StatisticViewScreen {
    // MARK: - Types

    private enum Identifiers {
        static let listIdentifier = "statisticsList"
    }

    // MARK: - Public Properties

    let application: XCUIApplication

    // MARK: - Public Methods

    func switchToStatisticsTab() -> Self {
        let statisticButton = application.tabBars.children(matching: .button).element(boundBy: 3)
        XCTAssertTrue(statisticButton.exists)
        statisticButton.tap()
        return self
    }
    
    func loadStatistics() -> Self {
        sleep(1)
        let usersList = listElement()
        XCTAssertTrue(usersList.exists)
        let firstCell = getFirstCell()
        XCTAssertTrue(firstCell?.exists ?? false)
        return self
    }
    
    func tapOnFirstCell() -> UserCardViewScreen? {
        let firstCell = getFirstCell()
        XCTAssertTrue(firstCell?.exists ?? false)
        guard let firstCell = firstCell else { return nil }
        firstCell.tap()
        sleep(1)
        return UserCardViewScreen(application: application)
    }

    // MARK: - Private Methods

    private func listElement() -> XCUIElement {
        return application.collectionViews.element(matching: NSPredicate(format: "identifier == '\(Identifiers.listIdentifier)'"))
    }

    private func getFirstCell() -> XCUIElement? {
        let cellsCount = listElement().children(matching: .cell).count
        if cellsCount == 0 {
            return nil
        }
        return listElement().children(matching: .cell).element(boundBy: 0)
    }

}

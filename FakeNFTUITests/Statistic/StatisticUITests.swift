//
//  StatisticUITests.swift
//  FakeNFTUITests
//
//  Created by Сергей Кухарев on 01.03.2025.
//

import XCTest

final class StatisticUITests: XCTestCase {
    private var app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchEnvironment = ["TEST": "true"]
        app.launch()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        app.terminate()
    }
    
    /// Тестирует основные элементы управления экрана в Figma "User Card":
    ///  - нажимает на кнопку Статистика
    ///  - дожидается загрузки списка пользователей из Сети
    ///  - нажимает на первый элемент в списке
    ///  - проверяет наличие основных элементов карточки пользователя (иконка, имя, кнопка на сайт, ссылка на список NFT).
    ///    наличие элемента управления с описанием не проверяется, т.к. оно опционально
    ///  - нажимает на кнопку перехода на сайт пользователя
    ///  - проверяет наличие WebView на экране (поиск идёт по наличию ProgressView, входящей в состав WebView)
    func testUserCardView() throws {
        let userCard = StatisticViewScreen(application: app)
            .switchToStatisticsTab()
            .loadStatistics()
            .tapOnFirstCell()
        guard let userCard = userCard else { return XCTFail("User card not found") }

        let nftsCollection = userCard.checkControlsExist()
            .checkUsersWebSiteButton()
            .showUsersNFTsCollection()
        guard let nftsCollection = nftsCollection else { return XCTFail("NFTs collection not found") }

        _ = nftsCollection.checkControlsExist()
    }
}

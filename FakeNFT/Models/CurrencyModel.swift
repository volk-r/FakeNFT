//
//  CurrencyModel.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/15/25.
//

struct CurrencyModel: Decodable, Identifiable {
    let id: String
    let title: String
    let name: String
    let image: String
}

extension CurrencyModel {
    static let mockCurrency: CurrencyModel = .init(
        id: "1", title: "SHIB", name: "Shiba_Inu", image: ""
    )
}

//
//  PriceFormatter.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/23/25.
//

import Foundation

struct PriceFormatter: Sendable {
    private let formatter: NumberFormatter
    private let currencySymbol: String
    
    init(
        currencySymbol: String,
        groupingSeparator: String = " ",
        decimalSeparator: String = ",",
        minimumFractionDigits: Int = 0,
        maximumFractionDigits: Int = 2
    ) {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = groupingSeparator
        formatter.decimalSeparator = decimalSeparator
        formatter.minimumFractionDigits = minimumFractionDigits
        formatter.maximumFractionDigits = maximumFractionDigits
        
        self.currencySymbol = currencySymbol
        self.formatter = formatter
    }
    
    func string(from price: Double) -> String {
        "\(formatter.string(from: NSNumber(value: price)) ?? String(price)) \(currencySymbol)"
    }
}

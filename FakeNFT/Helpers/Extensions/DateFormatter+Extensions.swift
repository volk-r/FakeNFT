//
//  DateFormatter+Extensions.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//
import Foundation

extension DateFormatter {
    // We use static var because creating a dateFormatter is an expensive operation and we should do it once
    @MainActor static var defaultDateFormatter: ISO8601DateFormatter = .init()
}

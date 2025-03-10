//
//  EditValueType.swift
//  FakeNFT
//
//  Created by Roman Romanov on 01.03.2025.
//

import SwiftUI

enum EditValueType: CaseIterable {
    case name
    case description
    case website
    
    var title: LocalizedStringKey {
        switch self {
        case .name:
            "Name"
        case .description:
            "Description"
        case .website:
            "Website"
        }
    }
    
    var placeholder: LocalizedStringKey {
        switch self {
        case .name:
            "Enter your name"
        case .description:
            "Tell us about yourself"
        case .website:
            "Enter your website"
        }
    }
    
    var lineLimit: Int {
        switch self {
        case .name: 1
        case .description: 5
        case .website: 1
        }
    }
}

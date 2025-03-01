//
//  TitleOfEditValue.swift
//  FakeNFT
//
//  Created by Roman Romanov on 28.02.2025.
//

import SwiftUI

struct TitleOfEditValue: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .appTextStyleHeadline3()
    }
}

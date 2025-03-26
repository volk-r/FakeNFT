//
//  AppTextFieldStyle.swift
//  FakeNFT
//
//  Created by Roman Romanov on 01.03.2025.
//

import SwiftUI

struct AppTextFieldStyle: ViewModifier {
    
    let lineLimit: Int
    private let roundedRectangle = RoundedRectangle(cornerRadius: 16)
    
    func body(content: Content) -> some View {
        content
            .appTextStyleBodyRegular()
            .lineLimit(lineLimit, reservesSpace: true)
            .padding(11)
            .padding(.horizontal, 5)
            .background(.appLightGray)
            .overlay(
                roundedRectangle
                    .stroke(.appLightGray, lineWidth: 1)
            )
            .clipShape(
                roundedRectangle
            )
    }
}

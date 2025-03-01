//
//  CustomTextField.swift
//  FakeNFT
//
//  Created by Roman Romanov on 01.03.2025.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: LocalizedStringKey
    let lineLimit: Int
    
    var body: some View {
        TextField(
            placeholder,
            text: $text,
            axis: lineLimit == 1
                ? .horizontal
                : .vertical
        )
        .clearButton(on: $text)
        .appTextFieldStyle(lineLimit: lineLimit)
    }
}

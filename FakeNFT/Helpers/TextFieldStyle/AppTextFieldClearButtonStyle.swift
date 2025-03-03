//
//  AppTextFieldClearButtonStyle.swift
//  FakeNFT
//
//  Created by Roman Romanov on 01.03.2025.
//

import SwiftUI

struct AppTextFieldClearButtonStyle: ViewModifier {
    
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
                .focused($isFocused)
                .padding(.trailing, 20)
            if !text.isEmpty && isFocused {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                .opacity(text.isEmpty ? 0 : 1)
                .buttonStyle(.plain)
                .foregroundColor(.secondary)
                .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: text)
    }
}

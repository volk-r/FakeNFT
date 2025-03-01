//
//  EditableValue.swift
//  FakeNFT
//
//  Created by Roman Romanov on 01.03.2025.
//

import SwiftUI

struct EditableValue: View {
    let valueType: EditValueType
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TitleOfEditValue(title: valueType.title)
            CustomTextField(
                text: $value,
                placeholder: valueType.placeholder,
                lineLimit: valueType.lineLimit
            )
        }
    }
}

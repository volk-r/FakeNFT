//
//  ProfileListItemView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 21.02.2025.
//

import SwiftUI

struct ProfileListItemView: View {
    
    let listItem: LocalizedStringKey
    
    var body: some View {
        HStack {
            Text(listItem)
            Spacer()
            Text("\(Image(systemName: "chevron.right"))")
        }
    }
}

// MARK: - Preview

#Preview {
    ProfileListItemView(listItem: LocalizedStringKey("About the developer"))
        .appTextStyleBodyBold()
        .padding()
}

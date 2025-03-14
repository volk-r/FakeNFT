//
//  CartDeleteItemConfirm.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/26/25.
//

import SwiftUI

struct CartDeleteItemConfirm: View {
    let onDelete: () -> Void
    let onCancel: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            VStack(spacing: 12) {
                Image(.appCartConfirm)
                    .resizable()
                    .frame(width: 108, height: 108)
                    .cornerRadius(12)
                Text("Are you sure you want remove an item from the trash?")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 180)
                    .appTextStyleBodyRegular()
            }
            HStack {
                Button(action: onDelete, label: {
                    Text("Delete")
                        .appTextStyleBodyRegular(withColor: .appRedUniversal)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 4)
                })
                .buttonStyle(.borderedProminent)
                .tint(.appBlack)
                .cornerRadius(12)
                Button(action: onCancel, label: {
                    Text("Return").appTextStyleBodyRegular(withColor: .appWhite)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 4)
                })
                .buttonStyle(.borderedProminent)
                .tint(.appBlack)
                .cornerRadius(12)
            }
        }
    }
}

#Preview {
    CartDeleteItemConfirm(onDelete: {}, onCancel: {})
}

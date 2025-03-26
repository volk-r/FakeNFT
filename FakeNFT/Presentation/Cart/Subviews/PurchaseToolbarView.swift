//
//  PurchaseToolbarView.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/25/25.
//

import SwiftUI

struct PurchaseToolbarView: View {
    let onAgreement: () -> Void
    let onPayment: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text("By making a purchase, you agree to the terms and conditions")
                    .appTextStyleCaption2()
                Button(action: onAgreement, label: {
                    Text("User agreement")
                        .appTextStyleCaption2(withColor: .appBlueUniversal)
                })
            }
            Button(action: onPayment, label: {
                Text("Pay")
                    .appTextStyleBodyBold(withColor: .appWhite)
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 44
                    )
            })
            .buttonStyle(.borderedProminent)
            .tint(.appBlack)
            .cornerRadius(16)
        }
        .padding(16)
        .background(.appLightGray)
        .clipShape(
            .rect(
                topLeadingRadius: 12,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 12
            )
        )
    }
}

#Preview {
    PurchaseToolbarView(onAgreement: {
        
    }, onPayment: {
        
    })
}

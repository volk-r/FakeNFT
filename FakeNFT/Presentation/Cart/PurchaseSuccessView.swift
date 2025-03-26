//
//  PurchaseSuccessView.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 2/25/25.
//

import SwiftUI

struct PurchaseSuccessView<ViewModel: PurchaseSuccessViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 20) {
                Image(.appPurchaseSuccess)
                    .resizable()
                    .frame(width: 278, height: 278)
                Text("Success! The payment went through Congratulations on your purchase!")
                    .multilineTextAlignment(.center)
                    .appTextStyleHeadline3()
            }
            .padding(.horizontal, 36)
            Spacer()
            Button(action: {
                viewModel.returnToCatalogButtonTapped()
            }, label: {
                Text("Return to catalog")
                    .appTextStyleBodyBold(withColor: .appWhite)
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 44
                    )
            })
            .buttonStyle(.borderedProminent)
            .tint(.appBlack)
            .cornerRadius(16)
            .padding(16)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack(path: .constant([""])) {
        EmptyView()
            .navigationDestination(for: String.self) { _ in
                PurchaseSuccessView(
                    viewModel: PurchaseSuccessViewModel {
                        
                    }
                )
            }
    }
}

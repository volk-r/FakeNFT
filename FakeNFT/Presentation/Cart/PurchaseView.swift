//
//  PurchaseView.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/2/25.
//

import SwiftUI

struct PurchaseView<ViewModel: PurchaseViewModelProtocol>: View {
    @Environment(\.dismiss) private var dismiss
    @State var viewModel: ViewModel
    
    var body: some View {
        VStack {
            LoadingSwitcher(
                viewModel.loadingState,
                content: { content },
                error: { error }
            )
        }
        .navigationTitle("Select payment method")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(
                    action: {
                        dismiss()
                    },
                    label: {
                        Image(.appBackward)
                            .foregroundStyle(.appBlack)
                    }
                )
            }
        }
        .alert(
            "Failed to make payment",
            isPresented: $viewModel.isPresentedErrorAlert
        ) {
            Button("Cancel", role: .cancel) { }
            Button("Repeat") { }
        }
        .task {
            await viewModel.getPurchase()
        }
    }
    
    private var content: some View {
        viewModel.purchaseItems.isEmpty ? AnyView(emptyItemsList) : AnyView(itemsList)
    }
    
    private let columns = [
        GridItem(.flexible(), spacing: 7),
        GridItem(.flexible())
    ]
    
    private var itemsList: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 7) {
                    ForEach(viewModel.purchaseItems) { item in
                        PurchaseItemView(
                            item: item,
                            isSelected: item == viewModel.selectedPurchaseItem
                        )
                        .onTapGesture {
                            viewModel.purchaseItemTapped(item)
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 16)
            }
            PurchaseToolbarView(
                onAgreement: {
                    viewModel.userAgreementTapped()
                },
                onPayment: {
                    viewModel.payButtonTapped()
                }
            )
        }
    }
    
    private var emptyItemsList: some View {
        CartEmptyView()
    }
    
    private var error: some View {
        CartErrorView()
    }
}

#Preview {
    NavigationStack(path: .constant([""])) {
        EmptyView()
            .navigationDestination(for: String.self) { _ in
                PurchaseView(viewModel: PurchaseViewModel(
                    navigationPath: .constant([])
                ))
            }
    }
}

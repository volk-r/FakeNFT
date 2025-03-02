//
//  CartView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//

import SwiftUI

struct CartView<ViewModel: CartViewModelProtocol>: View {
    // MARK: Properties
    
    @StateObject var viewModel: ViewModel
    
    // MARK: Views
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            VStack {
                LoadingSwitcher(
                    viewModel.loadingState,
                    content: { content },
                    error: { error }
                )
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        action: {
                            viewModel.sortButtonTapped()
                        },
                        label: {
                            Image(.appSortButton)
                                .foregroundStyle(.appBlack)
                        }
                    )
                }
            }
            .navigationDestination(for: CartNavigationPath.self) { screen in
                switch screen {
                case .purchase:
                    PurchaseView()
                }
            }
        }
        .task {
            await viewModel.getCart()
        }
    }
    
    var content: some View {
        viewModel.isEmptyCart ? AnyView(emptyItemsList) : AnyView(itemsList)
    }
    
    var itemsList: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.cartItems) { item in
                        CartItemView(item: item) {
                            viewModel.deleteCartItemButtonTapped(item)
                        }
                        .padding(16)
                    }
                }
                .padding(.top, 20)
            }
            .refreshable {
                await viewModel.refreshCart()
            }
            CartToolbarView(item: viewModel.cartToolbarItem) {
                viewModel.forPaymentButtonTapped()
            }
        }
    }
    
    var emptyItemsList: some View {
        CenteredScrollView {
            CartEmptyView()
        }
        .refreshable {
            await viewModel.refreshCart()
        }
    }
    
    var error: some View {
        CenteredScrollView {
            CartErrorView()
        }
        .refreshable {
            await viewModel.refreshCart()
        }
    }
}

#Preview {
    NavigationStack {
        CartView(
            viewModel: CartViewModel()
        )
    }
}

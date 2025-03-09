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
        VStack {
            LoadingSwitcher(
                viewModel.loadingState,
                content: { content },
                error: { error }
            )
        }
        .confirmationDialog(
            "Sorting",
            isPresented: $viewModel.isPresentedSortDialog,
            titleVisibility: .visible
        ) {
            Button("By price") {
                viewModel.sortType = .byPrice
            }
            Button("By rating") {
                viewModel.sortType = .byRating
            }
            Button("By name") {
                viewModel.sortType = .byName
            }
            Button("Close", role: .cancel) { }
        }
        .fullScreenCover(
            isPresented: $viewModel.isPresentedConfirmDelete
        ) {
            CartDeleteItemConfirm(onDelete: {
                viewModel.deleteConfirmTapped()
            }, onCancel: {
                viewModel.cancelDeleteConfirmTapped()
            })
            .presentationBackground(.ultraThinMaterial)
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
        .task {
            await viewModel.getCart()
        }
    }
    
    private var content: some View {
        viewModel.isEmptyCart ? AnyView(emptyItemsList) : AnyView(itemsList)
    }
    
    private var itemsList: some View {
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
    
    private var emptyItemsList: some View {
        CenteredScrollView {
            CartEmptyView()
        }
        .refreshable {
            await viewModel.refreshCart()
        }
    }
    
    private var error: some View {
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
            viewModel: CartViewModel(navigationPath: .constant([]))
        )
    }
}

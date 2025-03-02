//
//  StatisticView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//

import SwiftUI

struct StatisticView: View {
    // MARK: - State

    @State private var viewModel: StatisticViewModelProtocol

    // MARK: - Initializers

    init(viewModel: StatisticViewModelProtocol = StatisticViewModel()) {
        self.viewModel = viewModel
    }

    // MARK: - View

    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            ZStack {
                List(Array(viewModel.users.enumerated()), id: \.element.id) { index, user in
                    StatisticRowView(user: user)
                        .listRowSeparator(.hidden)
                        .listRowInsets(Constants.listRowEdgeInsets)
                        .onAppear {
                            Task {
                                await viewModel.fetchNextDataIfNeeded(currentRowIndex: index)
                            }
                        }
                        .onTapGesture {
                            viewModel.navigationPath.append(user)
                        }
                }
                .accessibilityIdentifier(Constants.listAccessibilityIdentifier)
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .padding(Constants.listEdgeInsets)
                .refreshable {
                    await viewModel.reloadData()
                }

                if viewModel.loadingState == .loading {
                    ZStack {
                        Color.black.opacity(Constants.loadingDataBackgroundShading)
                        ProgressView()
                            .frame(
                                width: Constants.loadingProgressViewSize,
                                height: Constants.loadingProgressViewSize
                            )
                            .background(Constants.loadingDataBackgroundColor)
                            .cornerRadius(Constants.loadingProgressViewCornerRadius)
                    }
                    .allowsHitTesting(true)
                }
            }
            .navigationDestination(for: User.self) { user in
                UserCardView(user: user, navigationPath: $viewModel.navigationPath)
            }
            .navigationDestination(for: UserWebSite.self) { userWebSite in
                WebView(navigationURL: userWebSite.website)
            }
            .navigationDestination(for: UserId.self) { userId in
                Text("\(userId.id)")
            }
            .alert(
                "",
                isPresented: $viewModel.showingErrorAlert,
                actions: {
                    Button("StatisticViewCancelButton", role: .cancel) {}
                    Button("StatisticViewRetryButton") {
                        Task {
                            await viewModel.retryLoadingData()
                        }
                    }
                    .keyboardShortcut(.defaultAction)
                },
                message: {
                    Text("StatisticViewErrorText")
                }
            )
            .confirmationDialog(
                "StatisticViewSortingDialogTitle",
                isPresented: $viewModel.showingSortDialog,
                titleVisibility: .visible
            ) {
                Button("StatisticViewSortingByName") {
                    viewModel.sortType = .byName
                }
                Button("StatisticViewSortingByRating") {
                    viewModel.sortType = .byRating
                }
                Button("StatisticViewCloseButton", role: .cancel) { }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(
                        action: {
                            viewModel.sortList()
                        },
                        label: {
                            Image(uiImage: Constants.sortButtonImage)
                                .foregroundStyle(Constants.sortButtonColor)
                        }
                    )
                    .disabled(viewModel.loadingState == .loading)
                }
            }
        }
        .accentColor(.appBlack)
        .task {
            await viewModel.loadData()
        }
    }
}

private extension StatisticView {
    // MARK: - Types
    
    private enum Constants {
        static let listAccessibilityIdentifier: String = "statisticsList"
        static let listEdgeInsets = EdgeInsets(
            top: 0,
            leading: 16,
            bottom: 0,
            trailing: 16
        )
        static let listRowEdgeInsets = EdgeInsets(
            top: 0,
            leading: 0,
            bottom: 8,
            trailing: 0
        )
        static let sortButtonImage: UIImage = .appSortButton
        static let sortButtonColor: Color = .appBlack
        static let loadingProgressViewSize: CGFloat = 80
        static let loadingProgressViewCornerRadius: CGFloat = 12
        static let loadingDataBackgroundShading: CGFloat = 0.4
        static let loadingDataBackgroundColor: Color = .appWhite
    }
}

#Preview {
    StatisticView()
}

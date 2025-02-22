//
//  StatisticView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//

import SwiftUI

struct StatisticView: View {
    // MARK: - Types

    private enum Constants {
        static let listEdgeInsets = EdgeInsets(
            top: 20,
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
    }

    // MARK: - State

    @State private var viewModel: StatisticViewModelProtocol

    // MARK: - View

    var body: some View {
        List(viewModel.users) { user in
            StatisticRowView(user: user)
                .listRowSeparator(.hidden)
                .listRowInsets(Constants.listRowEdgeInsets)
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .padding(Constants.listEdgeInsets)
        .refreshable {
            try? await viewModel.loadData()
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
            }
        }
        .task {
            try? await viewModel.loadData()
        }
    }

    // MARK: - Initializers

    init(viewModel: StatisticViewModelProtocol = StatisticViewModel()) {
        self.viewModel = viewModel
    }
}

#Preview {
    NavigationStack {
        StatisticView()
    }
}

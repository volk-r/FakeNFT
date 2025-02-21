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

    // MARK: - View

    var body: some View {
        List(viewModel.users) { user in
            
        }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(
                        action: {
                            viewModel.sortList()
                        },
                        label: {
                            Image(uiImage: .appSortButton)
                                .foregroundStyle(.appBlack)
                        }
                    )
                }
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

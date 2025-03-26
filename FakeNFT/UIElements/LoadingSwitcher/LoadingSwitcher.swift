//
//  LoadingSwitcher.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 23.02.2025.
//

import SwiftUI

struct LoadingSwitcher<Content: View>: View {
    let state: LoadingState
    let contentView: () -> Content
    let loadingView: (() -> any View)?
    let errorView: (() -> any View)?
    
    init(
        _ state: LoadingState,
        content: @escaping () -> Content,
        loading: (() -> any View)? = nil,
        error: (() -> any View)? = nil
    ) {
        self.state = state
        self.contentView = content
        self.loadingView = loading
        self.errorView = error
    }
    
    var body: some View {
        switch state {
        case .default:
            EmptyView()
        case .loading:
            if let loadingView {
                AnyView(loadingView())
            } else {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        case .success:
            contentView()
        case .failure:
            if let errorView {
                AnyView(errorView())
            } else {
                CustomErrorView()
            }
        }
    }
}

#Preview {
    Group {
        LoadingSwitcher(.success) {
            Text(verbatim: "Только контент")
        }
        
        LoadingSwitcher(
            .loading,
            content: {
                Text(verbatim: "Только контент")
            },
            loading: {
                HStack {
                    ProgressView()
                    Text(verbatim: "Ошибка загрузки")
                }
            }
        )
        
        LoadingSwitcher(
            .failure,
            content: {
                Text(verbatim: "Только контент")
            },
            error: {
                Text(verbatim: "Ошибка загрузки")
                    .foregroundColor(.red)
            }
        )
    }
}

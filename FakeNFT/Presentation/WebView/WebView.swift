//
//  WebViewView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 19.02.2025.
//

import SwiftUI

struct WebView: View {
    // MARK: - Types

    private enum Constants {
        static let progressViewIdentifier = "webViewProgressViewIdentifier"
    }

    // MARK: - Properties

    let navigationURL: String
    @State private var model = WebViewModel()

    var body: some View {
        VStack {
            ProgressView(value: model.loadingProgress)
                .accessibilityIdentifier(Constants.progressViewIdentifier)
                .progressViewStyle(.linear)
                .opacity(model.loadingProgress == 1.0 ? 0 : 1)
            ZStack {
                if model.isLoadingError {
                    VStack(spacing: 16) {
                        Image(systemName: "wifi.slash")
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: 150,
                                height: 150,
                                alignment: .center
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 70))
                        
                        Text("No internet")
                            .appTextStyleHeadline3()
                    }
                } else {
                    WebViewBridge(url: navigationURL)
                        .environment(model)
                    
                    if model.isLoading {
                        ProgressView()
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(URL(string: navigationURL)?.host(percentEncoded: true) ?? "")
        .toolbarRole(.editor)
        .ignoresSafeArea(edges: [.leading, .trailing, .bottom])
    }
}

#Preview {
    NavigationStack {
        WebView(navigationURL: GlobalConstants.mockURL)
    }
}

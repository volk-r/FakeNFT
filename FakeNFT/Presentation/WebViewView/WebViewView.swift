//
//  WebViewView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 19.02.2025.
//

import SwiftUI

struct WebViewView: View {
    
    // MARK: - Properties

    let navigationURL: String
    @StateObject private var model: WebViewModel = WebViewModel()

    var body: some View {
        VStack {
            ProgressView(value: model.loadingProgress)
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
                        .environmentObject(model)
                    
                    if model.isLoading {
                        ProgressView()
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea(edges: [.leading, .trailing, .bottom])
    }
}

#Preview {
    NavigationStack {
        WebViewView(navigationURL: GlobalConstants.mockURL)
            .environmentObject(WebViewModel())
    }
}

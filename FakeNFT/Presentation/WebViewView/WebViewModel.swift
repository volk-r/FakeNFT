//
//  WebViewModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 19.02.2025.
//

import Foundation

@MainActor
final class WebViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var isLoadingError = false
    
    @Published var isLoading = true
    @Published var loadingProgress: Double = 0.0
    
    // MARK: - init
    
    init() {
        isLoading = true
        loadingProgress = 0.0
        isLoadingError = false
    }
}

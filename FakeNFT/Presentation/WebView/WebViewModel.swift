//
//  WebViewModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 19.02.2025.
//

import Foundation

@Observable
final class WebViewModel {
    
    // MARK: - Properties
    
    var isLoadingError = false
    var isLoading = true
    var loadingProgress: Double = 0.0
    
    // MARK: - init
    
    init() {
        isLoading = true
        loadingProgress = 0.0
        isLoadingError = false
    }
}

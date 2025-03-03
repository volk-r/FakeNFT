//
//  AsyncPreviewModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 01.03.2025.
//

import SwiftUI

/// Эта структура помогает создать Preview c View, для которых необходимо выполнение асинхронного кода.
/// Для получения дополнительной информации см. [тред Stackoverflow](https://stackoverflow.com/questions/77336072/how-to-create-preview-with-async-code-in-swiftui).
struct AsyncPreviewModel<VisualContent: View, ModelData: Sendable>: View {
    // Standard view builder, accepting async-fetched data as a parameter
    var viewBuilder: (ModelData) -> VisualContent
    // data fetcher. Notice it can throw as well
    var model: () async throws -> ModelData?
    
    @State private var modelData: ModelData?
    @State private var error: Error?
    
    var body: some View {
        safeView
            .task {
                do {
                    self.modelData = try await model()
                } catch {
                    self.error = error
                    // print detailed error info to console
                    print(error)
                }
            }
    }
    
    @ViewBuilder
    private var safeView: some View {
        if let modelData {
            viewBuilder(modelData)
        }
        // in case of error, its description rendered
        // right on preview to make troubleshooting faster
        else if let error {
            Text(error.localizedDescription)
                .foregroundStyle(Color.red)
        }
        // a stub for awaiting.
        // Actually, we should return some non-empty view from here
        // to make sure .task { } is triggered
        else {
            Text(verbatim: "Calculating async data...")
        }
    }
}

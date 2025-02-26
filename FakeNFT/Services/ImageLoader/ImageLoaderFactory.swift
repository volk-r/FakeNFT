//
//  ImageLoaderFactory.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 22.02.2025.
//

import SwiftUI

struct ImageLoaderFactory: View {
    // MARK: - Constants

    let url: String

    // MARK: - Public Properties

    var contentMode: ContentMode = .fit
    var placeholder = Image(systemName: "photo.badge.exclamationmark.fill")
    var isShowActivityIndicator: Bool = true

    // MARK: - View

    var body: some View {
        SDWebImageLoader(
            url: url,
            placeholder: placeholder,
            contentMode: contentMode,
            isShowActivityIndicator: isShowActivityIndicator
        )
    }
}

#Preview("fit") {
    ImageLoaderFactory(
        url: GlobalConstants.mockPreviewImageUrl,
        contentMode: .fit
    )
}

#Preview("fill") {
    ImageLoaderFactory(
        url: GlobalConstants.mockPreviewImageUrl,
        contentMode: .fill
    )
}

#Preview("broken url") {
    ImageLoaderFactory(url: "https")
        .padding()
}

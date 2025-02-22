//
//  SDWebImageLoader.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 22.02.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct SDWebImageLoader: View {
    // MARK: - Constants

    let url: String
    let placeholder: Image

    // MARK: - Public Properties

    var contentMode: ContentMode
    var isShowActivityIndicator: Bool = true
    
    // MARK: - View

    var body: some View {
        WebImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            placeholder
                .resizable()
                .aspectRatio(contentMode: contentMode)
        }
        .applyIndicator(isShowActivityIndicator)
        .aspectRatio(contentMode: contentMode)
    }
}

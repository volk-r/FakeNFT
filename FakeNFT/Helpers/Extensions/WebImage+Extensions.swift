//
//  WebImage+Extensions.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 22.02.2025.
//

import SwiftUI
import SDWebImageSwiftUI

extension WebImage {
    @ViewBuilder
    func applyIndicator(_ isShowActivityIndicator: Bool) -> some View {
        if isShowActivityIndicator {
            self.indicator(.activity)
        } else {
            self
        }
    }
}

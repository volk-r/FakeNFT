//
//  CustomErrorView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 09.03.2025.
//

import SwiftUI

struct CustomErrorView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Something went wrong")
                .appTextStyleHeadline3(withColor: .appRedUniversal)
            Text("Try again later")
                .appTextStyleHeadline3(withColor: .appRedUniversal)
        }
    }
}

#Preview {
    CustomErrorView()
}

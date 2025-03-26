//
//  CenteredScrollView.swift
//  FakeNFT
//
//  Created by Леонид Лавров on 3/2/25.
//

import SwiftUI

struct CenteredScrollView<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        ScrollView {
            ZStack {
                Spacer()
                    .containerRelativeFrame([.horizontal, .vertical])
                content
            }
        }
    }
}

#Preview {
    CenteredScrollView {
        Text("Some view")
    }
}

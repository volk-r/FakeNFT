//
//  ShimmerView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 07.03.2025.
//

import SwiftUI

struct ShimmerView: View {
    // MARK: - State

    @State private var phase: CGFloat = -1.0

    // MARK: - View

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width

            let baseGradient = LinearGradient(
                gradient: Gradient(colors: [
                    Color.gray.opacity(0.3),
                    Color.gray.opacity(0.6),
                    Color.gray.opacity(0.3)
                ]),
                startPoint: .leading,
                endPoint: .trailing
            )

            baseGradient
                .mask(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0.0),
                            .init(color: Color.black.opacity(0.8), location: 0.5),
                            .init(color: .clear, location: 1.0)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: width / 2)
                    .offset(x: phase * (width + width / 2))
                )
                .onAppear {
                    withAnimation(
                        Animation.linear(duration: 1.5)
                            .repeatForever(autoreverses: false)
                    ) {
                        phase = 1.0
                    }
                }
        }
        .clipped()
    }
}

#Preview {
    ShimmerView()
}

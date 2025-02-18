//
//  AppTextStyles.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//
import SwiftUI

struct AppTextStyleBodyRegular: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .regular))
    }
}

struct AppTextStyleBodyBold: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .bold))
    }
}

struct AppTextStyleCaption1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15, weight: .regular))
    }
}

struct AppTextStyleCaption2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13, weight: .regular))
    }
}

struct AppTextStyleHeadline1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 34, weight: .bold))
    }
}

struct AppTextStyleHeadline2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 28, weight: .bold))
    }
}

struct AppTextStyleHeadline3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22, weight: .bold))
    }
}

struct AppTextStyleHeadline4: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .bold))
    }
}

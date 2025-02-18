//
//  View+Extensions.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//
import SwiftUI

extension View {
    func appTextStyleBodyRegular(withColor color: Color = .appBlack) -> some View {
        self.modifier(AppTextStyleBodyRegular())
            .foregroundStyle(color)
    }
    
    func appTextStyleBodyBold(withColor color: Color = .appBlack) -> some View {
        self.modifier(AppTextStyleBodyBold())
            .foregroundStyle(color)
    }
    
    func appTextStyleCaption1(withColor color: Color = .appBlack) -> some View {
        self.modifier(AppTextStyleCaption1())
            .foregroundStyle(color)
    }
    
    func appTextStyleCaption2(withColor color: Color = .appBlack) -> some View {
        self.modifier(AppTextStyleCaption2())
            .foregroundStyle(color)
    }
    
    func appTextStyleHeadline1(withColor color: Color = .appBlack) -> some View {
        self.modifier(AppTextStyleHeadline1())
            .foregroundStyle(color)
    }
    
    func appTextStyleHeadline2(withColor color: Color = .appBlack) -> some View {
        self.modifier(AppTextStyleHeadline2())
            .foregroundStyle(color)
    }
    
    func appTextStyleHeadline3(withColor color: Color = .appBlack) -> some View {
        self.modifier(AppTextStyleHeadline3())
            .foregroundStyle(color)
    }

    func appTextStyleHeadline4(withColor color: Color = .appBlack) -> some View {
        self.modifier(AppTextStyleHeadline4())
            .foregroundStyle(color)
    }
}

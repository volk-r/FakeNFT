//
//  ProfileAvatarView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 03.03.2025.
//

import SwiftUI

struct ProfileAvatarView: View {
    let avatarLink: String
    
    var body: some View {
        ImageLoaderFactory(
            url: avatarLink,
            contentMode: .fill,
            placeholder: Image(systemName: GlobalConstants.avatarPlaceHolder),
            isShowActivityIndicator: true
        )
        .frame(width: 70, height: 70)
        .clipShape(Circle())
    }
}

#Preview {
    let model = ProfileViewModel()
    model.loadMockProfile()
    return ProfileAvatarView(avatarLink: model.profile?.avatar ?? "")
}

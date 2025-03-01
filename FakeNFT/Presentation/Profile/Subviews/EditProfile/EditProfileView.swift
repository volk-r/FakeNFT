//
//  EditProfileView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 28.02.2025.
//

import SwiftUI

struct EditProfileView: View {
    
    // MARK: - Properties
    
    @Environment(ProfileViewModel.self) var profileModel
    @State private var viewModel = EditProfileViewModel()
    
    // MARK: - body
    
    var body: some View {
        ZStack {
            backgroundOverlay
            VStack {
                closeButton
                
                VStack(alignment: .leading, spacing: 24) {
                    photo
                    
                    EditableValue(
                        valueType: .name,
                        value: $viewModel.userName
                    )
                    EditableValue(
                        valueType: .description,
                        value: $viewModel.userDescription
                    )
                    EditableValue(
                        valueType: .website,
                        value: $viewModel.userWebsite
                    )
                }
                
                Spacer()
            }
        }
        .padding(.all, 16)
        .accentColor(.appBlack)
        .onAppear {
            viewModel.setupProfile(profileModel.profile)
        }
    }
}

private extension EditProfileView {
    
    // MARK: - hideKeyboard
    
    private var backgroundOverlay: some View {
        Color.clear
            .contentShape(Rectangle())
            .onTapGesture {
                hideKeyboard()
            }
    }
    
    // MARK: - hideKeyboard
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    // MARK: - editButton
    
    private var closeButton: some View {
        HStack {
            Spacer()
            Button(
                action: {
                    profileModel.isEditProfilePresented.toggle()
                },
                label: {
                    Image(systemName: "xmark")
                        .fontWeight(.bold)
                }
            )
        }
    }
    
    // MARK: - photo
    
    private var photo: some View {
        HStack(alignment: .center) {
            Spacer()
            Image(.profile)
                .resizable()
                .scaledToFit()
                .overlay {
                    Color(.appBlackUniversal)
                        .opacity(0.6)
                    Text("Change photo")
                        .appTextStyleCaption3(withColor: .appWhiteUniversal)
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                        .padding(2)
                }
                .clipShape(Circle())
                .frame(width: 70, height: 70)
            Spacer()
        }
        .padding(.top, 22)
    }
}

#Preview {
    let viewModel = ProfileViewModel()
    viewModel.loadMockProfile()
    
    return EditProfileView()
        .environment(viewModel)
}

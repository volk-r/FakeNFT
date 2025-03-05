//
//  ProfileView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//

import SwiftUI

struct ProfileView: View {
    
    // MARK: - Properties
    
    let profileId = GlobalConstants.mockProfileID
    @State private var viewModel = ProfileViewModel()
    
    // MARK: - body
    
    var body: some View {
        NavigationStack {
            LoadingSwitcher(
                viewModel.loadingState,
                content: { profile },
                error: { errorContent }
            )
        }
        .accentColor(.appBlack)
        .task {
            await viewModel.loadProfile(for: profileId)
        }
    }
}

private extension ProfileView {
    
    // MARK: - body
    
    private var profile: some View {
        VStack {
            Group {
                header
                userInfo
            }
            .padding(.horizontal, 16)
            
            optionList
        }
        .padding(.top, 20)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                editButton
            }
        }
        .navigationDestination(isPresented: $viewModel.isMyNFTPresented) {
            MyNFTView()
                .environment(viewModel)
        }
        .navigationDestination(isPresented: $viewModel.isFavoriteNFTsPresented) {
            FavoriteNFTsView()
                .environment(viewModel)
        }
        .navigationDestination(isPresented: $viewModel.isDeveloperInfoPresented) {
            WebView(navigationURL: viewModel.profile?.website ?? "")
        }
    }
    
    // MARK: - editButton
    
    private var editButton: some View {
        Button(
            action: {
                viewModel.isEditProfilePresented.toggle()
            },
            label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .frame(width: 26.34, height: 26.33)
                    .fontWeight(.bold)
                    .foregroundColor(.appBlack)
                    .padding(.trailing, 9)
            }
        )
        .sheet(isPresented: $viewModel.isEditProfilePresented) {
            EditProfileView(profile: viewModel.profile)
        }
    }
    
    // MARK: - header
    
    private var header: some View {
        HStack {
            ProfileAvatarView(avatarLink: viewModel.profile?.avatar ?? "")
            Text(verbatim: viewModel.profile?.name ?? "")
                .appTextStyleHeadline3()
                .padding(.leading, 16)
            Spacer()
        }
    }
    
    // MARK: - userInfo
    
    private var userInfo: some View {
        Group {
            Text(verbatim: viewModel.profile?.description ?? "")
                .appTextStyleCaption2()
                .padding(.top, 20)
            HStack {
                Button {
                    viewModel.isDeveloperInfoPresented = true
                } label: {
                    Text(verbatim: URL(string: viewModel.profile?.website ?? "")?.host(percentEncoded: true) ?? "")
                        .foregroundStyle(.appBlueUniversal)
                        .appTextStyleCaption1()
                }
                Spacer()
            }
            .padding(.top, 12)
        }
    }
    
    // MARK: - optionList
    
    private var optionList: some View {
        List {
            Section {
                ProfileListItemView(listItem: LocalizedStringKey("My NFTs (\(viewModel.getMyNFTsCount()))"))
                    .onTapGesture {
                        viewModel.isMyNFTPresented = true
                    }
                ProfileListItemView(listItem: LocalizedStringKey("Favorite NFTs (\(viewModel.getFavoriteNFTsCount()))"))
                    .onTapGesture {
                        viewModel.isFavoriteNFTsPresented = true
                    }
                ProfileListItemView(listItem: LocalizedStringKey("About the developer"))
                    .onTapGesture {
                        viewModel.isDeveloperInfoPresented = true
                    }
            }
            .appTextStyleBodyBold()
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .padding(.top)
    }
    
    // MARK: - errorContent
    
    // TODO: need general error view
    private var errorContent: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Something went wrong")
                .appTextStyleHeadline3(withColor: .appRedUniversal)
            Text("Try again later")
                .appTextStyleHeadline3(withColor: .appRedUniversal)
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        AppTabView()
    }
}

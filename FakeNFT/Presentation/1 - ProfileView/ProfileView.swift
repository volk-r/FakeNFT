//
//  ProfileView.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//

import SwiftUI

struct ProfileView: View {
    
    // MARK: - Properties
    
    @State private var viewModel = ProfileViewModel()
    
    // MARK: - body
    
    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    header
                    userInfo
                }
                .padding(.horizontal, 16)
                
                optionList
            }
            .padding(.top, 20)
        }
        .tint(.appGreenUniversal)
        .navigationDestination(isPresented: $viewModel.isAboutPresented) {
            WebViewView(navigationURL: viewModel.userWebsiteURL)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                editButton
            }
        }
    }
}

private extension ProfileView {
    
    // MARK: - editButton
    
    private var editButton: some View {
        Button(
            action: {
                // TODO: - open edit view
                print("Edit profile")
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
    }
    
    // MARK: - header
    
    private var header: some View {
        HStack(alignment: .center) {
            Image(.profile)
                .resizable()
                .frame(width: 70, height: 70)
            Text(verbatim: viewModel.name)
                .appTextStyleHeadline3()
                .padding(.leading, 16)
            Spacer()
        }
    }
    
    // MARK: - userInfo
    
    private var userInfo: some View {
        Group {
            Text(verbatim: viewModel.useInfo)
                .appTextStyleCaption2()
                .padding(.top, 20)
            HStack {
                Text(verbatim: viewModel.userWebsite)
                    .foregroundStyle(.appBlueUniversal)
                    .appTextStyleCaption1()
                    .onTapGesture {
                        viewModel.isAboutPresented = true
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
                ProfileListItemView(listItem: String(localized: "My NFTs (\(viewModel.nftCount))"))
                ProfileListItemView(listItem: String(localized: "Favorite NFTs (\(viewModel.nftFavoriteCount))"))
                ProfileListItemView(listItem: String(localized: "About"))
                    .onTapGesture {
                    viewModel.isAboutPresented = true
                }
            }
            .appTextStyleBodyBold()
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .padding(.top)
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        MainView()
    }
}

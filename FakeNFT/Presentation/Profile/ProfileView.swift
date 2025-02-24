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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    editButton
                }
            }
            .navigationDestination(isPresented: $viewModel.isAboutPresented) {
                WebView(navigationURL: viewModel.profile?.website ?? "")
            }
            .navigationDestination(isPresented: $viewModel.isMyNFTPresented) {
                MyNFTView()
                    .environment(viewModel)
            }
        }
        .accentColor(.appBlack)
        .onAppear {
            viewModel.loadProfile()
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
                .scaledToFit()
                .cornerRadius(70)
                .frame(width: 70, height: 70)
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
                Text(verbatim: URL(string: viewModel.profile?.website ?? "")?.host(percentEncoded: true) ?? "")
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
                ProfileListItemView(listItem: String(localized: "My NFTs (\(viewModel.profile?.nfts?.count ?? 0))"))
                    .onTapGesture {
                        viewModel.isMyNFTPresented = true
                    }
                ProfileListItemView(listItem: String(localized: "Favorite NFTs (\(viewModel.profile?.likes?.count ?? 0))"))
                ProfileListItemView(listItem: String(localized: "About the developer"))
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
        AppTabView()
    }
}

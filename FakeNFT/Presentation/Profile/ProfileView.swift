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
            .navigationDestination(isPresented: $viewModel.isMyNFTPresented) {
                MyNFTView()
                    .environment(viewModel)
            }
            .navigationDestination(isPresented: $viewModel.isFavoriteNFTsPresented) {
                FavoriteNFTsView()
                    .environment(viewModel)
            }
            .navigationDestination(isPresented: $viewModel.isAboutPresented) {
                WebView(navigationURL: viewModel.profile?.website ?? "")
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
        HStack {
            Image(.profile)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
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
                Button {
                    viewModel.isAboutPresented = true
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

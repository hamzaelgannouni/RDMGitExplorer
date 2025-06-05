//
//  GitHubUserProfileView.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import SwiftUI

struct GitHubUserProfileView: View {
    @StateObject private var viewModel: GitHubUserProfileViewModel
    
    init(username: String) {
        _viewModel = StateObject(wrappedValue: GitHubUserProfileViewModel(username: username))
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                Group {
                    if let user = viewModel.user {
                        profileContent(user: user)
                            .redacted(reason: viewModel.isLoading ? .placeholder: [])
                    } else {
                        messageView
                    }
                }
            }
            .refreshable {
                viewModel.fetchUser()
            }
            .navigationTitle("Profile")
            .onAppear {
                viewModel.fetchUser()
            }
            .padding()
        }
    }
    
    @ViewBuilder
    func profileContent(user: GitHubUser) -> some View {
        VStack(spacing: 16) {
            ProfileImageView(url: user.avatarUrl, size: 120)
            Text(user.name ?? user.login)
                .font(.title)
                .fontWeight(.bold)
            
            if let bio = user.bio {
                Text(bio)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            HStack(spacing: 24) {
                Label("\(user.followers)", systemImage: "person.2.fill")
                Label("\(user.following)", systemImage: "person.fill.checkmark")
            }
            .font(.headline)
            .foregroundColor(.primary)
            Spacer()
        }
    }
    
    @ViewBuilder
    var messageView: some View {
        if let error = viewModel.errorMessage {
            Text(error)
                .font(.headline)
                .foregroundColor(.orange)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}


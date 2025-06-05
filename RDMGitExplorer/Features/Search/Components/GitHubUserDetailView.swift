//
//  GitHubUserDetailView.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import SwiftUI

struct GitHubUserDetailView: View {
    let user: GitHubUser
    
    var body: some View {
        VStack(spacing: 16) {
            ProfileImageView(url: user.avatarUrl, size: 100)
            
            Text(user.name ?? "No name")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("@\(user.login)")
                .foregroundColor(.secondary)
            
            if let bio = user.bio {
                Text(bio)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            HStack(spacing: 24) {
                StatBlock(count: user.followers, label: "Followers", destination: .followers)
                StatBlock(count: user.following, label: "Following", destination: .following)
            }
            .padding(.top)
            
            Spacer()
        }
        .padding()
    }
    
    @ViewBuilder
    private func StatBlock(count: Int, label: String, destination: UserListType) -> some View {
        VStack {
            Text("\(count)")
                .font(.headline)
            NavigationLink {
                GitHubUserListView(username: user.login, listType: destination)
            } label: {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

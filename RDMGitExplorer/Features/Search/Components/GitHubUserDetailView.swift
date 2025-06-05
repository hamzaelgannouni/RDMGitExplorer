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
            AsyncImage(url: user.avatarUrl) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .shadow(radius: 4)
            
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
                VStack {
                    Text("\(user.followers)")
                        .font(.headline)
                    NavigationLink {
                        GitHubUserListView(username: user.login, listType: .followers)
                    } label: {
                        Text("Followers")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                VStack {
                    Text("\(user.following)")
                        .font(.headline)
                    NavigationLink {
                        GitHubUserListView(username: user.login, listType: .following)
                    } label: {
                        Text("Following")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.top)
            
            Spacer()
        }
        .padding()
    }
}

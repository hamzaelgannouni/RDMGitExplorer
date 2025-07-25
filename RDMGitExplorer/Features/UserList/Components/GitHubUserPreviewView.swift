//
//  GitHubUserPreviewView.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import SwiftUI

struct GitHubUserPreviewView: View {
    let user: GitHubUserPreview
    
    var body: some View {
        HStack(spacing: 16) {
            ProfileImageView(url: user.avatarUrl, size: 50)
            Text("@\(user.login)")
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

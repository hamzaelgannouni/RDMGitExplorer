//
//  GitHubUserPreview.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import Foundation

struct GitHubUserPreview: Decodable, Identifiable {
    let id: Int
    let login: String
    let avatarUrl: URL
}

extension GitHubUserPreview {
    static let mock: GitHubUserPreview = GitHubUserPreview(
        id: 1,
        login: "mockuser",
        avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/1?v=4")!
    )

    static let mockList: [GitHubUserPreview] = (1...4).map {
        GitHubUserPreview(
            id: $0,
            login: "mockuser\($0)",
            avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/\($0)?v=4")!
        )
    }
}

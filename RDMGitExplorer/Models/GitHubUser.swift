//
//  GitHubUser.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import Foundation

struct GitHubUser: Decodable, Identifiable {
    let id: Int
    let login: String
    let avatarUrl: URL
    let name: String?
    let bio: String?
    let followers: Int
    let following: Int
}

extension GitHubUser {
    static let mock = GitHubUser(
        id: 1,
        login: "octocat",
        avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/583231?v=4")!,
        name: "The Octocat",
        bio: "GitHub's official mascot. I love open source!",
        followers: 1234,
        following: 42
    )
}


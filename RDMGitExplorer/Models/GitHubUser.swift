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


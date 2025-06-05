//
//  GitHubAPIServiceProtocol.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import Foundation

protocol GitHubAPIServiceProtocol {
    func fetchUser(username: String) async throws -> GitHubUser
    func fetchFollowers(username: String) async throws -> [GitHubUserPreview]
    func fetchFollowing(username: String) async throws -> [GitHubUserPreview]
}

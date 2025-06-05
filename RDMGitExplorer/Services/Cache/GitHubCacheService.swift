//
//  GitHubCacheService.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import Foundation

final class GitHubCacheService {
    static let shared = GitHubCacheService()
    
    private var userCache: [String: GitHubUser] = [:]
    private var followersCache: [String: [GitHubUserPreview]] = [:]
    private var followingCache: [String: [GitHubUserPreview]] = [:]

    private init() {}

    func getUser(for username: String) -> GitHubUser? {
        userCache[username]
    }

    func cacheUser(_ user: GitHubUser) {
        userCache[user.login] = user
    }

    func getFollowers(for username: String) -> [GitHubUserPreview]? {
        followersCache[username]
    }

    func cacheFollowers(_ users: [GitHubUserPreview], for username: String) {
        followersCache[username] = users
    }

    func getFollowing(for username: String) -> [GitHubUserPreview]? {
        followingCache[username]
    }

    func cacheFollowing(_ users: [GitHubUserPreview], for username: String) {
        followingCache[username] = users
    }

    func clear() {
        userCache.removeAll()
        followersCache.removeAll()
        followingCache.removeAll()
    }
}

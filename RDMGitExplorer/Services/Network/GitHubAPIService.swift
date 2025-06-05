//
//  GitHubAPIService.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import Foundation

struct GitHubAPIService: GitHubAPIServiceProtocol {
    private let session: URLSessionProtocol
    private let baseURL = "https://api.github.com"
    private let cache = GitHubCacheService.shared

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func fetchUser(username: String) async throws -> GitHubUser {
        if let cached = cache.getUser(for: username) {
            return cached
        }
        let user: GitHubUser = try await fetch(endpoint: "users/\(username)")
        cache.cacheUser(user)
        return user
    }

    func fetchFollowers(username: String) async throws -> [GitHubUserPreview] {
        if let cached = cache.getFollowers(for: username) {
            return cached
        }
        let followers: [GitHubUserPreview] = try await fetch(endpoint: "users/\(username)/followers")
        cache.cacheFollowers(followers, for: username)
        return followers
    }

    func fetchFollowing(username: String) async throws -> [GitHubUserPreview] {
        if let cached = cache.getFollowing(for: username) {
            return cached
        }
        let following: [GitHubUserPreview] = try await fetch(endpoint: "users/\(username)/following")
        cache.cacheFollowing(following, for: username)
        return following
    }

    private func fetch<T: Decodable>(endpoint: String) async throws -> T {
        guard let url = URL(string: "\(baseURL)/\(endpoint)") else {
            throw GitHubAPIError.invalidURL
        }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw GitHubAPIError.unknown
        }

        switch httpResponse.statusCode {
        case 200:
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        case 404:
            throw GitHubAPIError.userNotFound
        default:
            throw GitHubAPIError.requestFailed(httpResponse.statusCode)
        }
    }
}

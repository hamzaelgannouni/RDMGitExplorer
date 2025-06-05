//
//  GitHubAPIService.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import Foundation

struct GitHubAPIService {
    private let session: URLSessionProtocol
    private let baseURL = "https://api.github.com"

    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func fetchUser(username: String) async throws -> GitHubUser {
        guard let url = URL(string: "\(baseURL)/users/\(username)") else {
            throw GitHubAPIError.invalidURL
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw GitHubAPIError.unknown
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw GitHubAPIError.requestFailed(httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUser.self, from: data)
        } catch {
            throw GitHubAPIError.decodingFailed
        }
    }
}


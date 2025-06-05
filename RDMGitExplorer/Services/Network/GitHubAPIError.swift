//
//  GitHubAPIError.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import Foundation

enum GitHubAPIError: Error, LocalizedError {
    case invalidURL
    case requestFailed(Int)
    case decodingFailed
    case notFound
    case rateLimited
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .requestFailed(let code):
            return "Request failed with status code \(code)."
        case .decodingFailed:
            return "Could not decode the response."
        case .notFound:
            return "User not found."
        case .rateLimited:
            return "Rate limit exceeded. Please wait and try again."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}

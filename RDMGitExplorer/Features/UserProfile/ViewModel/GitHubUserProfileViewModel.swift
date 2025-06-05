//
//  GitHubUserProfileViewModel.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import Foundation
import Combine

@MainActor
class GitHubUserProfileViewModel: ObservableObject {
    @Published var user: GitHubUser?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiService: GitHubAPIServiceProtocol
    let username: String
    
    init(username: String, apiService: GitHubAPIServiceProtocol = GitHubAPIService()) {
        self.username = username
        self.apiService = apiService
    }
    
    func fetchUser() {
        Task {
            defer {
                isLoading = false
            }
            isLoading = true
            errorMessage = nil
            user = .mock
            do {
                let fetchedUser = try await apiService.fetchUser(username: username)
                user = fetchedUser
            } catch {
                errorMessage = "Failed to load user: \(error.localizedDescription)"
                user = nil
            }
        }
    }

}

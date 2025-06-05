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
    
    private let apiService: GitHubAPIService
    let username: String
    
    init(username: String, apiService: GitHubAPIService = GitHubAPIService()) {
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
            await simulateLoading()
            do {
                let fetchedUser = try await apiService.fetchUser(username: username)
                user = fetchedUser
            } catch {
                errorMessage = "Failed to load user: \(error.localizedDescription)"
                user = nil
            }
        }
    }
    private func simulateLoading() async {
            do {
                let randomDelay = Double.random(in: 1.5...2)
                try await Task.sleep(nanoseconds: UInt64(randomDelay * 2_000_000_000))
            } catch {
                print("Sleep interrupted: \(error)")
            }
        }
}

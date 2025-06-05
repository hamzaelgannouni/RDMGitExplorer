//
//  GitHubUserSearchViewModel.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import Foundation
import Combine

@MainActor
final class GitHubUserSearchViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var user: GitHubUser?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let apiService: GitHubAPIServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(apiService: GitHubAPIServiceProtocol = GitHubAPIService()) {
        self.apiService = apiService
    }

    func searchUser() {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty else {
            user = nil
            return
        }
        isLoading = true
        errorMessage = nil
        Task {
            defer { isLoading = false }
            user = .mock
            do {
                let fetchedUser = try await apiService.fetchUser(username: username)
                self.user = fetchedUser
            } catch let error as GitHubAPIError {
                self.user = nil
                self.errorMessage = error.errorDescription
            } catch {
                self.user = nil
                self.errorMessage = "An unexpected error occurred."
            }
        }
    }
}

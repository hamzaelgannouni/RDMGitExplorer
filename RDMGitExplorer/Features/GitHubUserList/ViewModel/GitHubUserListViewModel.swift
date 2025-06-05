//
//  GitHubUserListViewModel.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import Foundation
import Combine

@MainActor
class GitHubUserListViewModel: ObservableObject {
    @Published var users: [GitHubUserPreview] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let apiService: GitHubAPIServiceProtocol
    private let username: String
    let listType: UserListType

    init(username: String, listType: UserListType, apiService: GitHubAPIServiceProtocol = GitHubAPIService()) {
        self.username = username
        self.listType = listType
        self.apiService = apiService
    }

    func fetchUsers() {
        Task {
            isLoading = true
            errorMessage = nil
            defer {
                isLoading = false
            }
            users = GitHubUserPreview.mockList
            do {
                switch listType {
                case .followers:
                    users = try await apiService.fetchFollowers(username: username)
                case .following:
                    users = try await apiService.fetchFollowing(username: username)
                }
            } catch {
                errorMessage = error.localizedDescription
                users = []
            }
        }
    }
}

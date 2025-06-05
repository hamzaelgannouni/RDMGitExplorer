//
//  GitHubUserListView.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import SwiftUI

struct GitHubUserListView: View {
    @StateObject private var viewModel: GitHubUserListViewModel
    
    init(username: String, listType: UserListType) {
        _viewModel = StateObject(wrappedValue: GitHubUserListViewModel(username: username, listType: listType))
    }
    
    var body: some View {
        NavigationStack {
            contentView
                .navigationTitle(viewModel.listType.title)
                .onAppear {
                    viewModel.fetchUsers()
                }
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        if let errorMessage = viewModel.errorMessage {
            Text(errorMessage)
                .font(.headline)
                .foregroundColor(.orange)
                .multilineTextAlignment(.center)
                .padding()
        } else {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.users) { user in
                        NavigationLink {
                            GitHubUserProfileView(username: user.login)
                        } label: {
                            GitHubUserPreviewView(user: user)
                                .redacted(reason: viewModel.isLoading ? .placeholder : [])
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.top)
            }
            .refreshable {
                viewModel.fetchUsers()
            }
        }
    }
}

//
//  GitHubUserSearchView.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import SwiftUI

struct GitHubUserSearchView: View {
    @StateObject private var viewModel = GitHubUserSearchViewModel()
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        NavigationStack {
            layoutView
                .onTapGesture {
                    isTextFieldFocused = false
                }
                .navigationTitle("GitHub User Search")
        }
    }
    
    var layoutView: some View {
        VStack(spacing: 20) {
            textField
            searchButton
            ScrollView {
                contentView
                    .redacted(reason: viewModel.isLoading ? .placeholder: [])
            }
        }
    }
    
    var textField: some View {
        TextField(
            "Enter a GitHub username and tap Search",
            text: $viewModel.username
        )
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.horizontal)
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .focused($isTextFieldFocused)
    }
    
    var searchButton: some View {
        Button(action: {
            isTextFieldFocused = false
            viewModel.searchUser()
        }) {
            Text("Search")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.horizontal)
        }
    }
    @ViewBuilder
    var contentView: some View {
        if let user = viewModel.user {
            GitHubUserDetailView(user: user)
        } else {
            VStack {
                Spacer()
                messageView
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    var messageView: some View {
        if let error = viewModel.errorMessage {
            Text(error)
                .font(.headline)
                .foregroundColor(.orange)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct GitHubUserSearchView_Previews: PreviewProvider {
    static var previews: some View {
        GitHubUserSearchView()
    }
}

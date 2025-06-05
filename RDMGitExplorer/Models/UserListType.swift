//
//  UserListType.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import Foundation

enum UserListType {
    case followers
    case following
    
    var title: String {
        switch self {
        case .followers: return "Followers"
        case .following: return "Following"
        }
    }
}

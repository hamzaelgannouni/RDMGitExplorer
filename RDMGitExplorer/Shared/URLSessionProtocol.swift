//
//  URLSessionProtocol.swift
//  RDMGitExplorer
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import Foundation

protocol URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}


extension URLSession: URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await data(for: request, delegate: nil)
    }
}


//
//  MockURLSession.swift
//  RDMGitExplorerTests
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import Foundation
@testable import RDMGitExplorer

final class MockURLSession: URLSessionProtocol {
    var dataToReturn: Data?
    var responseToReturn: URLResponse?
    var errorToReturn: Error?
    
    func data(from url: URL) async throws -> (Data, URLResponse) {
        if let error = errorToReturn {
            throw error
        }
        
        guard let data = dataToReturn, let response = responseToReturn else {
            throw URLError(.badServerResponse)
        }
        
        return (data, response)
    }
}

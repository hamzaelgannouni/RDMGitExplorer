//
//  RDMGitExplorerTests.swift
//  RDMGitExplorerTests
//
//  Created by ELGANNOUNI Hamza on 5/6/2025.
//

import XCTest
@testable import RDMGitExplorer

final class GitHubAPIServiceTests: XCTestCase {
    
    private var service: GitHubAPIService!
    private var mockSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        mockSession = MockURLSession()
        service = GitHubAPIService(session: mockSession)
    }
    
    override func tearDown() {
        service = nil
        mockSession = nil
        super.tearDown()
    }
    
    func testFetchUserSuccess() async throws {
        // Given
        let jsonString = """
        {
          "login": "hamzaelgannouni",
          "id": 31314571,
          "avatar_url": "https://avatars.githubusercontent.com/u/31314571?v=4",
          "name": "Hamza EL GANNOUNI",
          "bio": "Elève ingénieur à l'ENSIAS",
          "followers": 1,
          "following": 5
        }
        """
        mockSession.dataToReturn = Data(jsonString.utf8)
        mockSession.responseToReturn = HTTPURLResponse(
            url: URL(string: "https://api.github.com/users/hamzaelgannouni")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        mockSession.errorToReturn = nil
        
        // When
        let user = try await service.fetchUser(username: "hamzaelgannouni")
        
        // Then
        XCTAssertEqual(user.login, "hamzaelgannouni")
        XCTAssertEqual(user.id, 31314571)
        XCTAssertEqual(user.name, "Hamza EL GANNOUNI")
        XCTAssertEqual(user.bio, "Elève ingénieur à l'ENSIAS")
        XCTAssertEqual(user.followers, 1)
        XCTAssertEqual(user.following, 5)
    }
    
    func testFetchUserFailure() async {
        // Given
        mockSession.dataToReturn = nil
        mockSession.responseToReturn = nil
        mockSession.errorToReturn = NSError(domain: "Test", code: 1)
        
        // When / Then
        await XCTAssertThrowsErrorAsync(try await service.fetchUser(username: "unknown")) { error in
            // Optionally assert error type or message here
        }
    }
}

// Helper for async XCTAssertThrowsError
func XCTAssertThrowsErrorAsync<T>(_ expression: @autoclosure () async throws -> T,
                                  _ message: @autoclosure () -> String = "",
                                  file: StaticString = #filePath,
                                  line: UInt = #line,
                                  _ errorHandler: (Error) -> Void = {_ in}) async {
    do {
        _ = try await expression()
        XCTFail(message(), file: file, line: line)
    } catch {
        errorHandler(error)
    }
}

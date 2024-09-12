//
//  AuthServiceTests.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 11/09/24.
//

import XCTest
@testable import cora_ios_master

class AuthServiceTests: XCTestCase {
    
    var authService: AuthService!
    var mockNetworking: MockNetworking!
    
    override func setUp() {
        super.setUp()
        mockNetworking = MockNetworking()
        authService = AuthService(manager: mockNetworking)
    }
    
    override func tearDown() {
        authService = nil
        mockNetworking = nil
        super.tearDown()
    }
    
    func testAuthenticateSuccessWithMockJSON() {
        let responseData = loadJSON(filename: "authToken")
        
        mockNetworking.result = .success(responseData!)
        
        let credentials = LoginRequest(token: "dummyToken")
        let expectation = self.expectation(description: "Authenticate success")
        
        authService.authenticate(credentials: credentials) { result in
            switch result {
                case .success(let response):
                    XCTAssertEqual(response.token, "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjcGYiOiI0NDU5MDAwNzA5NiIsImlhdCI6MTcyNjA3MTM3NX0.HkKlhQtibfhCU6knavroC5M6mjhMvsQJCeSlhB4h8wg")
                case .failure:
                    XCTFail("Expected success, but got failure")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testAuthenticateJSONDecodingFailure() {
        let invalidResponseData = "invalid json".data(using: .utf8)!
        mockNetworking.result = .success(invalidResponseData)
        
        let credentials = LoginRequest(token: "dummyToken")
        let expectation = self.expectation(description: "Authenticate decoding failure")
        
        authService.authenticate(credentials: credentials) { result in
            switch result {
                case .success:
                    XCTFail("Expected failure, but got success")
                case .failure(let error):
                    XCTAssertTrue(error is DecodingError)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testAuthenticateNetworkFailure() {
        mockNetworking.result = .failure(.noData)
        
        let credentials = LoginRequest(token: "dummyToken")
        let expectation = self.expectation(description: "Authenticate network failure")
        
        authService.authenticate(credentials: credentials) { result in
            switch result {
                case .success:
                    XCTFail("Expected failure, but got success")
                case .failure(let error):
                    XCTAssert(error is NetworkError)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2)
    }
}

// MARK: - Utils
extension AuthServiceTests {
    
    func loadJSON(filename: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        if let url = bundle.url(forResource: filename, withExtension: "json") {
            return try? Data(contentsOf: url)
        }
        return nil
    }
}


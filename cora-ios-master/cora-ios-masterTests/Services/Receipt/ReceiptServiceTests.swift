//
//  ReceiptServiceTests.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 11/09/24.
//

import XCTest
@testable import cora_ios_master

class ReceiptServiceTests: XCTestCase {

    var receiptService: ReceiptService!
    var mockNetworking: MockNetworking!

    override func setUp() {
        super.setUp()
        mockNetworking = MockNetworking()
        receiptService = ReceiptService(manager: mockNetworking)
    }

    override func tearDown() {
        receiptService = nil
        mockNetworking = nil
        super.tearDown()
    }
    
    func testFetchReceiptListSuccess() {
        let responseData = loadJSON(filename: "receiptList")
        
        mockNetworking.result = .success(responseData!)
        
        let expectation = self.expectation(description: "Fetch receipt list success")
        
        receiptService.fetchReceiptList { result in
            switch result {
                case .success(let response):
                    XCTAssertEqual(response.results!.count, 4)
                    XCTAssertEqual(response.results![0].items[0].id, "abc123def456ghi789")
                    XCTAssertEqual(response.results![0].items[0].amount, 150000)
                case .failure:
                    XCTFail("Expected success, but got failure")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 2)
    }
    
    func testFetchReceiptListJSONDecodingFailure() {
        let invalidResponseData = "invalid json".data(using: .utf8)!
        mockNetworking.result = .success(invalidResponseData)

        let expectation = self.expectation(description: "Fetch receipt list decoding failure")
        
        receiptService.fetchReceiptList { result in
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
    
    func testFetchReceiptListNetworkFailure() {
        mockNetworking.result = .failure(.noData)

        let expectation = self.expectation(description: "Fetch receipt list network failure")
        
        receiptService.fetchReceiptList { result in
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
    
    func testFetchDetailsSuccess() {
        let responseData = loadJSON(filename: "receiptDetail")
        
        mockNetworking.result = .success(responseData!)
        
        let expectation = self.expectation(description: "Fetch details success")
        
        receiptService.fetchDetails(id: "abc123def456ghi789") { result in
            switch result {
                case .success(let receipt):
                    XCTAssertEqual(receipt.id, "abcdef12-3456-7890-abcd-ef1234567890")
                    XCTAssertEqual(receipt.amount, 150000)
                case .failure:
                    XCTFail("Expected success, but got failure")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testFetchDetailsJSONDecodingFailure() {
        let invalidResponseData = "invalid json".data(using: .utf8)!
        mockNetworking.result = .success(invalidResponseData)
        
        let expectation = self.expectation(description: "Fetch details decoding failure")
        
        receiptService.fetchDetails(id: "abc123def456ghi789") { result in
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
    
    func testFetchDetailsNetworkFailure() {
        mockNetworking.result = .failure(.noData)
        
        let expectation = self.expectation(description: "Fetch details network failure")
        
        receiptService.fetchDetails(id: "abc123def456ghi789") { result in
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
extension ReceiptServiceTests {
    
    func loadJSON(filename: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        if let url = bundle.url(forResource: filename, withExtension: "json") {
            return try? Data(contentsOf: url)
        }
        return nil
    }
    
}


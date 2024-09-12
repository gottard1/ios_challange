//
//  MockNetworking.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 11/09/24.
//

import XCTest
@testable import cora_ios_master

class MockNetworking: Networking {
    var result: Result<Data, NetworkError>?

    func execute(target: CoraTargetType, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        if let result = result {
            completion(result)
        }
    }
}

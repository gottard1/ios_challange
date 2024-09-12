//
//  AuthTarget.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import Foundation

enum AuthTarget {
    case authenticate(object: LoginRequest)
}

extension AuthTarget: CoraTargetType {
    
    var baseURL: String {
        return "https://api.challenge.stage.cora.com.br/challenge"
    }
    
    var path: String {
        switch self {
            case .authenticate:
                return "/auth"
        }
    }
    
    var method: NetworkMethods {
        return .post
    }
    
    var headers: [String: String]? {
        var headers = [String: String]()
        headers["Content-Type"] = "application/json"
        headers["apikey"] = "0f51363e39894fac9229a785b4bb4a4f"
        if let token = AuthManager.shared.authToken {
            headers["token"] = token
        }
        return headers
    }
    
    var body: Data? {
        switch self {
            case .authenticate(let credentials):
                return try? JSONEncoder().encode(credentials)
        }
    }
    
}


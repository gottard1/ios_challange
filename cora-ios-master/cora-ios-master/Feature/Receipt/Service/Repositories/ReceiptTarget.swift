//
//  ReceiptTarget.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import Foundation

enum ReceiptTarget {
    case fetchList
    case getDetails(id: String)
}

extension ReceiptTarget: CoraTargetType {
    
    var baseURL: String {
        return "https://api.challenge.stage.cora.com.br/challenge"
    }
    
    var path: String {
        switch self {
            case .fetchList:
                return "/list"
            case .getDetails(let id):
                return "/details/\(id)"
        }
    }
    
    var method: NetworkMethods {
        return .get
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
        return nil
    }
}

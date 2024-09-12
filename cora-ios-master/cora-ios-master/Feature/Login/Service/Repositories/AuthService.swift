//
//  AuthService.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import Foundation

final class AuthService {
    
    private let manager: Networking
    
    init(manager: Networking = NetworkManager()) {
        self.manager = manager
    }
    
    func authenticate(credentials: LoginRequest, completion: @escaping (Result<TokenResponse, Error>) -> Void) {
        let target = AuthTarget.authenticate(object: credentials)
        manager.execute(target: target) { result in
            switch result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(TokenResponse.self, from: data)
                        AuthManager.shared.authToken = response.token
                        completion(.success(response))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}

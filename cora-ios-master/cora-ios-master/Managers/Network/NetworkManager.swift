//
//  NetworkManager.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import Foundation

protocol Networking {
    func execute(target: CoraTargetType, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

final class NetworkManager: Networking {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func execute(target: CoraTargetType, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: target.baseURL + target.path) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        request.httpBody = target.body
        
        if let headers = target.headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        let task = session.dataTask(with: request) { [weak self] (data, response, error) in
            if let error = error {
                completion(.failure(.apiError(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if (200...299).contains(response.statusCode) {
                    guard let data = data else {
                        completion(.failure(.noData))
                        return
                    }
                    completion(.success(data))
                } else {
                    print("STATUS CODE \(response.statusCode)")
                    self?.handleStatusCode(response.statusCode, target: target, completion: completion)
                }
            } else {
                completion(.failure(.noData))
            }
        }
        task.resume()
    }
}

// MARK: - Reauth
extension NetworkManager {
    
    private func handleStatusCode(_ statusCode: Int, target: CoraTargetType, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        switch statusCode {
            case 401:
                reauthenticate { [weak self] result in
                    switch result {
                        case .success:
                            self?.execute(target: target, completion: completion)
                        case .failure(let reauthError):
                            completion(.failure(reauthError))
                    }
                }
            default:
                completion(.failure(.statusCode(statusCode)))
        }
    }
    
    private func reauthenticate(completion: @escaping (Result<Void, NetworkError>) -> Void) {
        let service = AuthService()
        
        guard let token = AuthManager.shared.authToken else {
            completion(.failure(.reauthenticationFailed))
            return
        }
        
        let credentials = LoginRequest(token: token)
        
        service.authenticate(credentials: credentials) { result in
            switch result {
                case .success(let data):
                    AuthManager.shared.authToken = data.token
                    completion(.success(()))
                case .failure:
                    completion(.failure(.reauthenticationFailed))
            }
        }
    }
}

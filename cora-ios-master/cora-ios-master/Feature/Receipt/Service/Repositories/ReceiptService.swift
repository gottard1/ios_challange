//
//  ReceiptService.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import Foundation

class ReceiptService {
    
    private let manager: Networking
    
    init(manager: Networking = NetworkManager()) {
        self.manager = manager
    }
    
    func fetchReceiptList(completion: @escaping (Result<TransactionResponse, Error>) -> Void) {
        let target = ReceiptTarget.fetchList
        manager.execute(target: target) { result in
            switch result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let token = try decoder.decode(TransactionResponse.self, from: data)
                        completion(.success(token))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
    func fetchDetails(id: String, completion: @escaping (Result<ReceiptModel, Error>) -> Void) {
        let target = ReceiptTarget.getDetails(id: id)
        manager.execute(target: target) { result in
            switch result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let receipt = try decoder.decode(ReceiptModel.self, from: data)
                        completion(.success(receipt))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}

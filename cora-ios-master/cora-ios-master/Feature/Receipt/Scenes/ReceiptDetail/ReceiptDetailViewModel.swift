//
//  ReceiptDetailViewModel.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 11/09/24.
//

import Foundation

protocol ReceiptDetailViewModelDelegate: AnyObject {
    func showLoading()
    func hideLoading()
    func getDetailsSuccess(response: ReceiptModel)
    func getDetailsError(message: String)
}

final class ReceiptDetailViewModel {
    
    weak var delegate: ReceiptDetailViewModelDelegate?
    
    private let service: ReceiptService
    
    init(service: ReceiptService = .init()) {
        self.service = service
    }
    
    func getReceiptDetails(id: String) {
        delegate?.showLoading()
        
        service.fetchDetails(id: id) { [weak self] result in
            self?.delegate?.hideLoading()
            
            switch result {
                case .success(let data):
                    self?.delegate?.getDetailsSuccess(response: data)
                case .failure(let error):
                    self?.delegate?.getDetailsError(message: error.localizedDescription)
            }
        }
    }
}

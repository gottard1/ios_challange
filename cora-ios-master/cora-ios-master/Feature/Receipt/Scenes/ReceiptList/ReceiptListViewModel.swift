//
//  ReceiptListViewModel.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 10/09/24.
//

import Foundation

protocol ReceiptListViewModelDelegate: AnyObject {
    func showLoading()
    func hideLoading()
    func fetchReceiptListSuccess()
    func fetchReceiptListError(
        message: String
    )
}

final class ReceiptListViewModel {
    
    weak var delegate: ReceiptListViewModelDelegate?
    
    private let service: ReceiptService
    
    init(service: ReceiptService = .init()) {
        self.service = service
    }
    
    var transactions: TransactionResponse = .init()
    
    func fetchReceiptList() {
        delegate?.showLoading()
        
        service.fetchReceiptList { [weak self] result in
            self?.delegate?.hideLoading()
            
            switch result {
                case .success(let response):
                    self?.transactions = response
                    self?.delegate?.fetchReceiptListSuccess()
                case .failure(let error):
                    self?.delegate?.fetchReceiptListError(message: error.localizedDescription)
            }
        }
    }
}

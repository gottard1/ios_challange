//
//  LoginPasswordViewModel.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import Foundation

protocol LoginPasswordViewModelDelegate: AnyObject {
    func showLoading()
    func hideLoading()
    func authenticateSuccess()
    func authenticateError(with message: String)
}


final class LoginPasswordViewModel {
    
    weak var delegate: LoginPasswordViewModelDelegate?
    
    private let service: AuthService = .init()
    
    var credentials: LoginRequest
    
    init(cpf: String) {
        credentials = LoginRequest(cpf: cpf, password: "")
    }
    
    func authenticateUser() {
        delegate?.showLoading()
        
        service.authenticate(credentials: credentials) { [weak self] result in
            self?.delegate?.hideLoading()
            
            switch result {
                case .success:
                    self?.delegate?.authenticateSuccess()
                case .failure(let error):
                    self?.delegate?.authenticateError(with: error.localizedDescription)
            }
        }
    }
}

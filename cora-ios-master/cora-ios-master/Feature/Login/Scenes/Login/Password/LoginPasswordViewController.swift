//
//  LoginPasswordViewController.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import UIKit

final class LoginPasswordViewController: UIViewController {
    
    private let mainView: LoginPasswordView = .init()
    private let viewModel: LoginPasswordViewModel
    
    init(cpf: String) {
        viewModel = LoginPasswordViewModel(cpf: cpf)
        super.init(nibName: nil, bundle: nil)
        title = "Login Cora"
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        mainView.passwordTextField.customDelegate = self
        viewModel.delegate = self
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
    }
}

// MARK: - ViewModel Delegate
extension LoginPasswordViewController: LoginPasswordViewModelDelegate {
    
    func showLoading() {
        mainView.nextButton.isLoading = true
    }
    
    func hideLoading() {
        mainView.nextButton.isLoading = false
    }
    
    func authenticateSuccess() {
        DispatchQueue.main.async {  [weak self] in
            let controller = ReceiptListViewController()
            self?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func authenticateError(with message: String) {
        showAlert(title: "Atenção", message: message, buttons: [.init(title: "OK", style: .destructive)])
    }
}


// MARK: - Button actions
extension LoginPasswordViewController {
    @objc
    private func nextButtonTapped() {
        let password = mainView.passwordTextField.text
        viewModel.credentials.password = password ?? ""
        viewModel.authenticateUser()
    }
}

// MARK: - Textfield Delegate
extension LoginPasswordViewController: CoraTextFieldDelegate {
    
    func textFieldDidComplete(_ textField: CoraTextField, isValid: Bool) {
        mainView.nextButton.isEnabled = isValid
    }
    
}

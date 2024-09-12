//
//  LoginCPFViewController.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 05/09/24.
//

import UIKit

final class LoginCPFViewController: UIViewController {
    
    private let mainView: LoginCPFView = .init()
    private let viewModel: LoginCPFViewModel
    
    init() {
        viewModel = LoginCPFViewModel()
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
        mainView.cpfTextField.customDelegate = self
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
    }
}

// MARK: - Textfield Delegate
extension LoginCPFViewController: CoraTextFieldDelegate {
    
    func textFieldDidComplete(_ textField: CoraTextField, isValid: Bool) {
        mainView.nextButton.isEnabled = isValid
    }
    
}

// MARK: - Button actions
extension LoginCPFViewController {
    @objc
    private func nextButtonTapped() {
        let cpf = mainView.cpfTextField.getUnformattedCPF() ?? ""
        viewModel.credentials.cpf = cpf
        let controller = LoginPasswordViewController(cpf: viewModel.credentials.cpf ?? "")
        navigationController?.pushViewController(controller, animated: true)
    }
}


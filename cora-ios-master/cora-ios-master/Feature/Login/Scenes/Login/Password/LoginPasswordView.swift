//
//  LoginPasswordView.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import UIKit

final class LoginPasswordView: UIView {
    
    private let passwordTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite sua senha de acesso"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let passwordTextField: CoraTextField = {
        let textfield = CoraTextField(type: .password)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let nextButton: CoraButton = {
        let button = CoraButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        button.customTitle = "Próximo"
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueci minha senha", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.pinkFE3E6D, for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        buildHierarchy()
        buildConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout
extension LoginPasswordView {
    
    private func buildHierarchy() {
        addSubview(passwordTitle)
        addSubview(passwordTextField)
        addSubview(forgotPasswordButton)
        addSubview(nextButton)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            passwordTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 28),
            passwordTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            passwordTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTitle.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTitle.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTitle.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: passwordTitle.leadingAnchor),
            
            nextButton.topAnchor.constraint(greaterThanOrEqualTo: forgotPasswordButton.bottomAnchor, constant: 12),
            nextButton.leadingAnchor.constraint(equalTo: passwordTitle.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: passwordTitle.trailingAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 54),
            nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
        ])
    }
}


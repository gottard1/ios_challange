//
//  LoginCPFView.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 05/09/24.
//

import UIKit

final class LoginCPFView: UIView {
    
    private let welcomeBackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bem-vindo de volta!"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray6B7076
        return label
    }()
    
    private let cpfLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Qual seu CPF?"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let cpfTextField: CoraTextField = {
        let textfield = CoraTextField(type: .cpf)
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
extension LoginCPFView {
    
    private func buildHierarchy() {
        addSubview(welcomeBackLabel)
        addSubview(cpfLabel)
        addSubview(cpfTextField)
        addSubview(nextButton)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            welcomeBackLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            welcomeBackLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            welcomeBackLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            cpfLabel.topAnchor.constraint(equalTo: welcomeBackLabel.bottomAnchor, constant: 8),
            cpfLabel.leadingAnchor.constraint(equalTo: welcomeBackLabel.leadingAnchor),
            cpfLabel.trailingAnchor.constraint(equalTo: welcomeBackLabel.trailingAnchor),
            
            cpfTextField.topAnchor.constraint(equalTo: cpfLabel.bottomAnchor, constant: 12),
            cpfTextField.leadingAnchor.constraint(equalTo: welcomeBackLabel.leadingAnchor),
            cpfTextField.trailingAnchor.constraint(equalTo: welcomeBackLabel.trailingAnchor),
            cpfTextField.heightAnchor.constraint(equalToConstant: 60),
            
            nextButton.topAnchor.constraint(greaterThanOrEqualTo: cpfTextField.bottomAnchor, constant: 12),
            nextButton.leadingAnchor.constraint(equalTo: welcomeBackLabel.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: welcomeBackLabel.trailingAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 54),
            nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
        ])
    }
}

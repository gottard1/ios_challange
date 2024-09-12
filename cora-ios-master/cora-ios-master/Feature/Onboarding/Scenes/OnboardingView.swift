//
//  OnboardingView.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 05/09/24.
//

import UIKit

final class OnboardingView: UIView {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .personOnboarding
        return imageView
    }()
    
    private let digitalAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Conta Digital PJ"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let powerfullLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Poderosamente simples"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 3
        label.text = "Sua empresa livre burocracias e de taxas para gerar boletos, fazer transferências e pagamentos."
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let signUpButton: CoraButton = {
        let button = CoraButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.enabledBackgroundColor = .white
        button.buttonContentColor = .pinkFE3E6D
        button.customTitle = "Quero fazer parte!"
        return button
    }()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Já sou cliente", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .pinkFE3E6D
        buildHierarchy()
        buildConstraints()
        
        AuthManager.shared.clearToken()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout
extension OnboardingView {
    
    private func buildHierarchy() {
        addSubview(backgroundImageView)
        addSubview(digitalAccountLabel)
        addSubview(powerfullLabel)
        addSubview(descriptionLabel)
        addSubview(signUpButton)
        addSubview(signInButton)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 390),
            
            digitalAccountLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 12),
            digitalAccountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            digitalAccountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            powerfullLabel.topAnchor.constraint(equalTo: digitalAccountLabel.bottomAnchor, constant: 12),
            powerfullLabel.leadingAnchor.constraint(equalTo: digitalAccountLabel.leadingAnchor),
            powerfullLabel.trailingAnchor.constraint(equalTo: digitalAccountLabel.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: powerfullLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: digitalAccountLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: digitalAccountLabel.trailingAnchor),
            
            signUpButton.topAnchor.constraint(greaterThanOrEqualTo: descriptionLabel.bottomAnchor, constant: 24),
            signUpButton.leadingAnchor.constraint(equalTo: digitalAccountLabel.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: digitalAccountLabel.trailingAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 64),
            
            signInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 26),
            signInButton.leadingAnchor.constraint(equalTo: digitalAccountLabel.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: digitalAccountLabel.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 44),
            signInButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
        ])
    }
}

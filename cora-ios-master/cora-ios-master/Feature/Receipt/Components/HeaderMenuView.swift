//
//  HeaderMenuView.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 10/09/24.
//

import UIKit

import UIKit

final class HeaderMenuView: UIView {
    
    private let allButton: HeaderButton = {
        let button = HeaderButton()
        button.setTitle("Tudo", for: .normal)
        return button
    }()
    
    private let entryButton: HeaderButton = {
        let button = HeaderButton()
        button.setTitle("Entrada", for: .normal)
        return button
    }()
    
    private let exitButton: HeaderButton = {
        let button = HeaderButton()
        button.setTitle("Saída", for: .normal)
        return button
    }()
    
    private let futureButton: HeaderButton = {
        let button = HeaderButton()
        button.setTitle("Futuro", for: .normal)
        return button
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.filter, for: .normal)
        button.tintColor = .pinkFE3E6D
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [allButton, entryButton, exitButton, futureButton])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        setupInitialSelection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(buttonsStackView)
        addSubview(filterButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            buttonsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            filterButton.centerYAnchor.constraint(equalTo: buttonsStackView.centerYAnchor),
            filterButton.widthAnchor.constraint(equalToConstant: 24),
            filterButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupInitialSelection() {
        allButton.setSelected(true)
        entryButton.setSelected(false)
        exitButton.setSelected(false)
        futureButton.setSelected(false)
    }
}

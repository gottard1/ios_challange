//
//  FilteredPlaceholderViewController.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 19/09/24.
//

import UIKit

final class FilteredPlaceholderView: UIView {
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .grayF0F4F8
        setupTopMenu()
        setupPlaceholders()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTopMenu() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let allButton = createMenuButton(title: "Tudo", isSelected: true)
        let entryButton = createMenuButton(title: "Entrada")
        let exitButton = createMenuButton(title: "Saída")
        let futureButton = createMenuButton(title: "Futuro")
        
        stackView.addArrangedSubview(allButton)
        stackView.addArrangedSubview(entryButton)
        stackView.addArrangedSubview(exitButton)
        stackView.addArrangedSubview(futureButton)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        let filterButton = UIButton()
        let filterIcon: UIImage = .filter
        filterButton.setImage(filterIcon, for: .normal)
        filterButton.tintColor = .pinkFE3E6D
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(filterButton)
        
        NSLayoutConstraint.activate([
            filterButton.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            filterButton.widthAnchor.constraint(equalToConstant: 24),
            filterButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupPlaceholders() {
        let placeholders = [
            createPlaceholderView(height: 40),
            createPlaceholderView(height: 30),
            createPlaceholderView(height: 30),
            createPlaceholderView(height: 30),
            createPlaceholderView(height: 30),
            createPlaceholderView(height: 30),
            createPlaceholderView(height: 40)
        ]
        
        let stackView = UIStackView(arrangedSubviews: placeholders)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func createMenuButton(title: String, isSelected: Bool = false) -> UIButton {
        let button = HeaderButton()
        button.setTitle(title, for: .normal)
        button.setSelected(isSelected)
        return button
    }
    
    private func createPlaceholderView(height: CGFloat) -> UIView {
        let placeholder = UIView()
        placeholder.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        placeholder.layer.cornerRadius = 8
        placeholder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placeholder.heightAnchor.constraint(equalToConstant: height)
        ])
        return placeholder
    }
}


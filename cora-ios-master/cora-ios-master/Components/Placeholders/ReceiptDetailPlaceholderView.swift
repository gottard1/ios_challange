//
//  ReceiptDetailPlaceholderViewController.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 13/09/24.
//

import UIKit

final class ReceiptDetailPlaceholderView: UIView {
    private let firstCell: UIView = createPlaceholderCell(height: 40)
    private let secondCell: UIView = createPlaceholderCell(height: 20)
    private let thirdCell: UIView = createPlaceholderCell(height: 40)
    private let fourthCell: UIView = createPlaceholderCell(height: 20)
    private let fifthCell: UIView = createPlaceholderCell(height: 40)
    private let sixthCell: UIView = createPlaceholderCell(height: 20)
    private let seventhCell: UIView = createPlaceholderCell(height: 40)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(firstCell)
        addSubview(secondCell)
        addSubview(thirdCell)
        addSubview(fourthCell)
        addSubview(fifthCell)
        addSubview(sixthCell)
        addSubview(seventhCell)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            firstCell.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            firstCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            firstCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            firstCell.heightAnchor.constraint(equalToConstant: 40),
            
            secondCell.topAnchor.constraint(equalTo: firstCell.bottomAnchor, constant: 12),
            secondCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            secondCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            secondCell.heightAnchor.constraint(equalToConstant: 20),
            
            thirdCell.topAnchor.constraint(equalTo: secondCell.bottomAnchor, constant: 12),
            thirdCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            thirdCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            thirdCell.heightAnchor.constraint(equalToConstant: 40),
            
            fourthCell.topAnchor.constraint(equalTo: thirdCell.bottomAnchor, constant: 12),
            fourthCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            fourthCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            fourthCell.heightAnchor.constraint(equalToConstant: 20),
            
            fifthCell.topAnchor.constraint(equalTo: fourthCell.bottomAnchor, constant: 12),
            fifthCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            fifthCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            fifthCell.heightAnchor.constraint(equalToConstant: 40),
            
            sixthCell.topAnchor.constraint(equalTo: fifthCell.bottomAnchor, constant: 12),
            sixthCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            sixthCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            sixthCell.heightAnchor.constraint(equalToConstant: 20),
            
            seventhCell.topAnchor.constraint(equalTo: sixthCell.bottomAnchor, constant: 12),
            seventhCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            seventhCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            seventhCell.heightAnchor.constraint(equalToConstant: 40),
            
            bottomAnchor.constraint(equalTo: seventhCell.bottomAnchor, constant: 16)
        ])
    }
    
    private static func createPlaceholderCell(height: CGFloat) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        return view
    }
}

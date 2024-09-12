//
//  InfoView.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 11/09/24.
//


import UIKit

class InfoView: UIView {
    
    private let fromToLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray3B3B3B
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .gray3B3B3B
        return label
    }()
    
    private let bankDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray6B7076
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(title: String, name: String, description: String) {
        fromToLabel.text = title
        nameLabel.text = name
        bankDescriptionLabel.text = description
    }
    
    private func setupView() {
        addSubview(fromToLabel)
        addSubview(nameLabel)
        addSubview(bankDescriptionLabel)
        
        NSLayoutConstraint.activate([
            fromToLabel.topAnchor.constraint(equalTo: topAnchor),
            fromToLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            fromToLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: fromToLabel.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bankDescriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            bankDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            bankDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            bankDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

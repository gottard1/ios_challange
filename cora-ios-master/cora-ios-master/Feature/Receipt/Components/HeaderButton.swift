//
//  HeaderButton.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 10/09/24.
//

import UIKit

final class HeaderButton: UIButton {
    
    private let underlineView = UIView()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        underlineView.backgroundColor = .clear
        addSubview(underlineView)
        
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            underlineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            underlineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            underlineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
    func setSelected(_ selected: Bool) {
        if selected {
            setTitleColor(.pinkFE3E6D, for: .normal)
            underlineView.backgroundColor = .pinkFE3E6D
        } else {
            setTitleColor(.gray6B7076, for: .normal)
            underlineView.backgroundColor = .clear
        }
    }
}

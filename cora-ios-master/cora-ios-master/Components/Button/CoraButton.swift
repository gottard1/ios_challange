//
//  CoraButton.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 05/09/24.
//

import UIKit

class CoraButton: UIButton {
    
    private let customTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    var isLoading: Bool = false {
        didSet {
            updateLoadingState()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? enabledBackgroundColor : .grayC7CBCF
        }
    }
    
    var enabledBackgroundColor: UIColor? = .pinkFE3E6D {
        didSet {
            backgroundColor = enabledBackgroundColor
        }
    }
    
    var customTitle: String? {
        didSet {
            customTitleLabel.text = customTitle
        }
    }
    
    var customImage: UIImage? = .arrowRight {
        didSet {
            customImageView.image = customImage
        }
    }
    
    var buttonContentColor: UIColor? = .white {
        didSet {
            customTitleLabel.textColor = buttonContentColor
            customImageView.tintColor = buttonContentColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildHierarchy()
        buildConstraints()
        setupButton()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupButton() {
        backgroundColor = enabledBackgroundColor
        layer.cornerRadius = 16
        
        customTitleLabel.textColor = buttonContentColor
        customImageView.tintColor = buttonContentColor
        customImageView.image = customImage
    }
    
    private func updateLoadingState() {
        DispatchQueue.main.async {  [weak self] in
            guard let self else { return }
            
            if self.isLoading {
                self.customTitleLabel.isHidden = true
                self.customImageView.isHidden = true
                self.activityIndicator.startAnimating()
                self.isUserInteractionEnabled = false
            } else {
                self.customTitleLabel.isHidden = false
                self.customImageView.isHidden = false
                self.activityIndicator.stopAnimating()
                self.isUserInteractionEnabled = true
            }
        }
    }
}

// MARK: - Layout
extension CoraButton {
    
    private func buildHierarchy() {
        addSubview(customTitleLabel)
        addSubview(customImageView)
        addSubview(activityIndicator)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            customTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            customTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            customTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: customImageView.leadingAnchor, constant: -8),
            
            customImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            customImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            customImageView.widthAnchor.constraint(equalToConstant: 24),
            customImageView.heightAnchor.constraint(equalToConstant: 24),
            
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

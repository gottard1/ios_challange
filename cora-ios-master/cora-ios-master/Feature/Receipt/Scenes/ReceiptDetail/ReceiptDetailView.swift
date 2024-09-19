//
//  ReceiptDetailView.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 11/09/24.
//

import UIKit

final class ReceiptDetailView: UIView {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    let placeholderView: ReceiptDetailPlaceholderView = {
        let view = ReceiptDetailPlaceholderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let paymentSentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .arrowUpOut
        imageView.tintColor = .gray3B3B3B
        return imageView
    }()
    
    private let paymentSentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Transferência enviada"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .gray3B3B3B
        return label
    }()
    
    private let amountLabel: TitleAndDescView = {
        let view = TitleAndDescView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dateLabel: TitleAndDescView = {
        let view = TitleAndDescView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.descLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return view
    }()
    
    private let senderView: InfoView = {
        let view = InfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let recipientView: InfoView = {
        let view = InfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let descriptionLabel: TitleAndDescView = {
        let view = TitleAndDescView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.descLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.descLabel.textColor = .gray6B7076
        return view
    }()
    
    let shareButton: CoraButton = {
        let button = CoraButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.customTitle = "Compartilhar comprovante"
        button.customImage = .share
        button.buttonContentColor = .white
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
    
    func setupView(details: ReceiptModel) {
        amountLabel.titleLabel.text = "Valor"
        amountLabel.descLabel.text = details.amount?.toCurrencyBRL() ?? ""
        
        dateLabel.titleLabel.text = "Data"
        dateLabel.descLabel.text = details.dateEvent?.formattedDate(for: .timeOnly) ?? ""
        
        if let sender = details.sender {
            senderView.setup(
                title: "De:",
                name: sender.name,
                description: "\(sender.documentNumber)\n\(sender.bankName)\n\(sender.agencyNumber)"
            )
        }
        
        if let recipient = details.recipient {
            recipientView.setup(
                title: "Para:",
                name: recipient.name,
                description: "\(recipient.documentNumber)\n\(recipient.bankName)\n\(recipient.agencyNumber)"
            )
        }
        
        descriptionLabel.titleLabel.text = "Descrição"
        descriptionLabel.descLabel.text = details.description
    }
    
    func toggleViews(showPlaceholder: Bool) {
        placeholderView.isHidden = !showPlaceholder
        containerView.isHidden = showPlaceholder
    }
}

// MARK: - Layout
extension ReceiptDetailView {
    
    private func buildHierarchy() {
        addSubview(placeholderView)
        addSubview(containerView)
        containerView.addSubview(paymentSentImageView)
        containerView.addSubview(paymentSentLabel)
        containerView.addSubview(amountLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(senderView)
        containerView.addSubview(recipientView)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(shareButton)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            placeholderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            placeholderView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            placeholderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            placeholderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            containerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            paymentSentImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32),
            paymentSentImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            paymentSentImageView.heightAnchor.constraint(equalToConstant: 24),
            paymentSentImageView.widthAnchor.constraint(equalToConstant: 24),
            
            paymentSentLabel.topAnchor.constraint(equalTo: paymentSentImageView.topAnchor),
            paymentSentLabel.leadingAnchor.constraint(equalTo: paymentSentImageView.trailingAnchor, constant: 8),
            paymentSentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            amountLabel.topAnchor.constraint(equalTo: paymentSentLabel.bottomAnchor, constant: 32),
            amountLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            amountLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            dateLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 16),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            senderView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 24),
            senderView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            senderView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            recipientView.topAnchor.constraint(equalTo: senderView.bottomAnchor, constant: 24),
            recipientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            recipientView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: recipientView.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            shareButton.topAnchor.constraint(greaterThanOrEqualTo: descriptionLabel.bottomAnchor, constant: 32),
            shareButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            shareButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            shareButton.heightAnchor.constraint(equalToConstant: 54),
            shareButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24)
        ])
    }
}


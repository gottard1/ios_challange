//
//  ReceiptDetailView.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 11/09/24.
//

import UIKit

final class ReceiptDetailView: UIView {
    
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
}



// MARK: - Layout
extension ReceiptDetailView {
    
    private func buildHierarchy() {
        addSubview(paymentSentImageView)
        addSubview(paymentSentLabel)
        addSubview(amountLabel)
        addSubview(dateLabel)
        addSubview(senderView)
        addSubview(recipientView)
        addSubview(descriptionLabel)
        addSubview(shareButton)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            paymentSentImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            paymentSentImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            paymentSentImageView.heightAnchor.constraint(equalToConstant: 24),
            paymentSentImageView.widthAnchor.constraint(equalToConstant: 24),
            
            paymentSentLabel.topAnchor.constraint(equalTo: paymentSentImageView.topAnchor),
            paymentSentLabel.leadingAnchor.constraint(equalTo: paymentSentImageView.trailingAnchor, constant: 8),
            paymentSentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            amountLabel.topAnchor.constraint(equalTo: paymentSentLabel.bottomAnchor, constant: 32),
            amountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            dateLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 16),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            senderView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 24),
            senderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            senderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            recipientView.topAnchor.constraint(equalTo: senderView.bottomAnchor, constant: 24),
            recipientView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            recipientView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: recipientView.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            shareButton.topAnchor.constraint(greaterThanOrEqualTo: descriptionLabel.bottomAnchor, constant: 32),
            shareButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            shareButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            shareButton.heightAnchor.constraint(equalToConstant: 54),
            shareButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
}


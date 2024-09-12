//
//  ReceiptTableViewCell.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 10/09/24.
//


import UIKit

final class ReceiptTableViewCell: UITableViewCell {
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray3B3B3B
        return imageView
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .gray3B3B3B
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray3B3B3B
        return label
    }()
    
    private let receiverLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray6B7076
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray6B7076
        return label
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Configuration Method
    func configure(with data: TransactionItem) {
        statusLabel.text = data.label
        receiverLabel.text = data.name
        timeLabel.text = data.dateEvent.formattedDate(for: .timeOnly) ?? ""
        
        switch data.entry {
            case "DEBIT":
                amountLabel.text = data.amount.toCurrencyBRL()
                iconImageView.image = .arrowUpOut
            case "CREDIT":
                amountLabel.text = data.amount.toCurrencyBRL()
                iconImageView.tintColor = .blue1A93DA
                amountLabel.textColor = .blue1A93DA
                statusLabel.textColor = .blue1A93DA
                iconImageView.image = .arrowDownIn
            case "TAX":
                amountLabel.text = data.amount.toCurrencyBRL()
                iconImageView.image = .percentage
            case "BARCODE":
                amountLabel.text = data.amount.toCurrencyBRL()
                iconImageView.image = .barCode
            default:
                amountLabel.text = data.amount.toCurrencyBRL()
                iconImageView.image = .arrowReturn
        }
    }
    
    private func addMiddleStrokeIfNeeded(text: String, label: UILabel) {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
        
        label.attributedText = attributedString
    }
}

// MARK: - Layout
extension ReceiptTableViewCell {
    
    private func setupUI() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(amountLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(receiverLabel)
        contentView.addSubview(timeLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            amountLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor),
            amountLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            
            statusLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 4),
            statusLabel.leadingAnchor.constraint(equalTo: amountLabel.leadingAnchor),
            
            receiverLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 4),
            receiverLabel.leadingAnchor.constraint(equalTo: amountLabel.leadingAnchor),
            receiverLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

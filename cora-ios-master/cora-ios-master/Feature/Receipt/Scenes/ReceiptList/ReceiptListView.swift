//
//  ReceiptListView.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 10/09/24.
//

import UIKit

final class ReceiptListView: UIView {
    
    private let menuView: HeaderMenuView = {
        let menu = HeaderMenuView()
        menu.translatesAutoresizingMaskIntoConstraints = false
        return menu
    }()
    
    let receiptTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ReceiptTableViewCell.self, forCellReuseIdentifier: String(describing: ReceiptTableViewCell.self))
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        return tableView
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
}

// MARK: - Layout
extension ReceiptListView {
    
    private func buildHierarchy() {
        addSubview(menuView)
        addSubview(receiptTableView)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            receiptTableView.topAnchor.constraint(equalTo: menuView.bottomAnchor),
            receiptTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            receiptTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            receiptTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

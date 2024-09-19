//
//  ReceiptListView.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 10/09/24.
//

import UIKit

final class ReceiptListView: UIView {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    let placeholderView: FilteredPlaceholderView = {
        let view = FilteredPlaceholderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    func toggleViews(showPlaceholder: Bool) {
        placeholderView.isHidden = !showPlaceholder
        containerView.isHidden = showPlaceholder
    }
}

// MARK: - Layout
extension ReceiptListView {
    
    private func buildHierarchy() {
        addSubview(containerView)
        addSubview(placeholderView)
        containerView.addSubview(menuView)
        containerView.addSubview(receiptTableView)
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
            
            menuView.topAnchor.constraint(equalTo: containerView.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            receiptTableView.topAnchor.constraint(equalTo: menuView.bottomAnchor),
            receiptTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            receiptTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            receiptTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}


//
//  ReceiptListViewController.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 10/09/24.
//

import UIKit

final class ReceiptListViewController: UIViewController {
    
    private let mainView: ReceiptListView = .init()
    private let viewModel: ReceiptListViewModel
    
    init() {
        viewModel = ReceiptListViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Extrato"
        
        viewModel.delegate = self
        mainView.receiptTableView.delegate = self
        mainView.receiptTableView.dataSource = self
        
        viewModel.fetchReceiptList()
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
        
        let rightButton = UIBarButtonItem(image: .share, style: .done, target: self, action: nil)
    }
}

// MARK: - ViewModel Delegate
extension ReceiptListViewController: ReceiptListViewModelDelegate {
    
    func showLoading() { }
    
    func hideLoading() { }
    
    func fetchReceiptListSuccess() {
        DispatchQueue.main.async { [weak self] in
            self?.mainView.receiptTableView.reloadData()
        }
    }
    
    func fetchReceiptListError(message: String) {
        showAlert(title: "Atenção", message: message, buttons: [.init(title: "OK", style: .cancel)])
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension ReceiptListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.transactions.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let itensPerSection = viewModel.transactions.results?[section].items.count ?? 0
        return itensPerSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ReceiptTableViewCell.self), for: indexPath) as? ReceiptTableViewCell else {
            return UITableViewCell()
        }
        
        if let transaction = viewModel.transactions.results?[indexPath.section].items[indexPath.row] {
            cell.configure(with: transaction)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idDetails = viewModel.transactions.results?[indexPath.section].items[indexPath.row].id
        let controller = ReceiptDetailViewController(id: idDetails ?? "")
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

// MARK: - Header and footer configuration
extension ReceiptListViewController {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let transaction = viewModel.transactions.results?[section]
        
        let headerView = SectionHeaderView()
        if let formattedDate = transaction?.date.formattedDate(for: .weekdayDayMonthFull) {
            headerView.configure(with: formattedDate.capitalizingFirstLetter())
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}

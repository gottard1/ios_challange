//
//  ReceiptDetailViewController.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 11/09/24.
//


import UIKit

class ReceiptDetailViewController: UIViewController {
    
    private let mainView: ReceiptDetailView = .init()
    private let viewModel: ReceiptDetailViewModel
    
    init(id: String) {
        self.viewModel = ReceiptDetailViewModel()
        super.init(nibName: nil, bundle: nil)
        viewModel.getReceiptDetails(id: id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes da transferência"
        mainView.shareButton.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        viewModel.delegate = self
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
    }
    
}

// MARK: - ViewModel Delegate
extension ReceiptDetailViewController: ReceiptDetailViewModelDelegate {
    
    func showLoading() { }
    
    func hideLoading() { }
    
    func getDetailsSuccess(response: ReceiptModel) {
        DispatchQueue.main.async { [weak self] in
            self?.mainView.setupView(details: response)
        }
    }
    
    func getDetailsError(message: String) { 
        showAlert(title: "Atenção", message: message, buttons: [.init(title: "OK", style: .destructive)])
    }
    
}


// MARK: - Actions
extension ReceiptDetailViewController {
    
    @objc private func didTapShareButton() {
        showAlert(title: "Compartilhar", message: "Compartilhando comprovante", buttons: [.init(title: "OK", style: .cancel)])
    }
}


//
//  OnboardingViewController.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 05/09/24.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    private let mainView: OnboardingView = .init()
    
    override func loadView() {
        view = mainView
        
        mainView.signUpButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        mainView.signInButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

// MARK: - Button actions
extension OnboardingViewController {
    @objc 
    private func buttonTapped() {
        let controller = LoginCPFViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}


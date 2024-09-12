//
//  UIViewController+Extension.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, buttons: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        buttons.forEach { button in
            alert.addAction(button)
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true)
        }
    }
    
}


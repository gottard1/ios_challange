//
//  CoraNavigationController.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 05/09/24.
//


import UIKit

final class CoraNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .grayF0F4F8
        appearance.titleTextAttributes = [.foregroundColor: UIColor.grayC7CBCF]
        
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        
        let backButtonAppearance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
        backButtonAppearance.tintColor = .pinkFE3E6D
        backButtonAppearance.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 0)], for: .normal)
        
        navigationBar.isTranslucent = true
    }
}

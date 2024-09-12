//
//  SceneDelegate.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 05/09/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = CoraNavigationController(rootViewController: OnboardingViewController())
        window?.makeKeyAndVisible()
    }
}


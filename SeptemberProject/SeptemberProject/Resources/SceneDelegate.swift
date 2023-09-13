//
//  SceneDelegate.swift
//  SeptemberProject
//
//  Created by Artur Imanbaev on 05.09.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: windowScene)
//        window?.makeKeyAndVisible()
//        window?.rootViewController = ViewController()
        
        let window = UIWindow(windowScene: windowScene)
        
        
        let navigationController = UINavigationController(rootViewController: AutorizetionViewController())
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.viewControllers.first?.navigationItem.largeTitleDisplayMode = .always
        window.rootViewController = navigationController
        
//        window.rootViewController = RestorePasswordViewController()//ViewController()
//        window.rootViewController = RegistrationViewController()
//        window.rootViewController = AutorizetionViewController()
        window.makeKeyAndVisible()
        self.window = window
    }


}


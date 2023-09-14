//
//  SceneDelegate.swift
//  SeptemberProject
//
//  Created by Artur Imanbaev on 05.09.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController()
        
        appCoordinator = AppCoordinator(navCon: navController)
        appCoordinator?.start()

        window.rootViewController = navController
        self.window = window
        window.makeKeyAndVisible()
        //        window = UIWindow(windowScene: windowScene)
//        window?.makeKeyAndVisible()
//        window?.rootViewController = ViewController()
        
//        let window = UIWindow(windowScene: windowScene)
//
//
//        let navigationController = UINavigationController(rootViewController: AutorizetionViewController())
//        navigationController.navigationBar.prefersLargeTitles = true
//        navigationController.viewControllers.first?.navigationItem.largeTitleDisplayMode = .always
//        window.rootViewController = navigationController
//
////        window.rootViewController = RestorePasswordViewController()//ViewController()
////        window.rootViewController = RegistrationViewController()
////        window.rootViewController = AutorizetionViewController()
//        window.makeKeyAndVisible()
//        self.window = window
    }


}


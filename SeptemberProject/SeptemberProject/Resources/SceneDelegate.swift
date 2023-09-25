//
//  SceneDelegate.swift
//  SeptemberProject
//
//  Created by Artur Imanbaev on 05.09.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    //var window: UIWindow?

    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        
        
        
        let appCoordinator = AppCoordinator(window: window)
        self.appCoordinator = appCoordinator
        appCoordinator.start()
        
        //let navController = UINavigationController()
//        appCoordinator = AppCoordinator(navCon: navController)
//        appCoordinator?.start()

        window.makeKeyAndVisible()
        
    }
}

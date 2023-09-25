//
//  AppCoordinator.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 14.09.2023.
//

import UIKit

class AppCoordinator: Coordinator {
//    var parentCoordinator: Coordinator?
    var children = [Coordinator]()
    //var navigationController: UINavigationController
    
    let window: UIWindow
    
    var isLogin: Bool = true

    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        print("App Coordinator start")
        
        if isLogin {
           let mainTabCoordinator = MainTabCoordinator()
            mainTabCoordinator.start()
            self.children = [mainTabCoordinator]
            window.rootViewController = mainTabCoordinator.rootViewController
        } else {
            let authCoordinator = AuthorizationCoordinator()
            authCoordinator.start()
            self.children = [authCoordinator]
            window.rootViewController = authCoordinator.rootViewContoller
        }
    }
}

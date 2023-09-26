//
//  AppCoordinator.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 14.09.2023.
//

import UIKit

class AppCoordinator: Coordinator {

    var children = [Coordinator]()
    
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {

        let isLogin: Bool = getIsLogin()
        
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
    
    private func getIsLogin() -> Bool {
        let result = UserDefaults.standard.bool(forKey: K.loginKey)
        return result
    }
}

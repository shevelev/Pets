//
//  AppCoordinator.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 14.09.2023.
//

import UIKit
import FirebaseAuth

class AppCoordinator: Coordinator {

    var children = [Coordinator]()
    
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        if Auth.auth().currentUser != nil {
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

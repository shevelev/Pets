//
//  FriendsTabCoordinator.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 25.09.2023.
//

import UIKit

class FriendsTabCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    
    lazy var friendsTabViewController: FriendsTabViewController = {
       let vc = FriendsTabViewController()
        vc.title = "Friends"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([friendsTabViewController], animated: true)
    }
}


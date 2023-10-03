//
//  ProfileTabCoordinator.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 25.09.2023.
//

import UIKit

class ProfileTabCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    
    lazy var profileTabViewController: ProfileTabViewController = {
       let vc = ProfileTabViewController()
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([profileTabViewController], animated: true)
    }
}

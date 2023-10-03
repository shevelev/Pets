//
//  WalkTabCoordinator.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 25.09.2023.
//

import UIKit

class WalkTabCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    
    lazy var walkTabViewController: WalkTabViewController = {
       let vc = WalkTabViewController()
        vc.title = "Walk"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([walkTabViewController], animated: true)
    }
}

//
//  MainTabCoordinator.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 25.09.2023.
//

import Foundation
import UIKit

class MainTabCoordinator: Coordinator {
    
    var rootViewController: UITabBarController
    var children = [Coordinator]()
    
    init() {
        self.rootViewController = UITabBarController()
        setupTabBar()
    }
    
    func start() {
        let profileCoordinator = ProfileTabCoordinator()
        profileCoordinator.start()
        self.children.append(profileCoordinator)
        let profileViewController = profileCoordinator.rootViewController
        setup(vc: profileViewController, imageName: "profileIcon")
        
        let walkCoordinator = WalkTabCoordinator()
        walkCoordinator.start()
        self.children.append(walkCoordinator)
        let walkViewController = walkCoordinator.rootViewController
        setup(vc: walkViewController, imageName: "walkIcon")
        
        let friendsCoordinator = FriendsTabCoordinator()
        friendsCoordinator.start()
        self.children.append(friendsCoordinator)
        let friendsViewController = friendsCoordinator.rootViewController
        setup(vc: friendsViewController, imageName: "friendsIcon")
        
        self.rootViewController.viewControllers = [profileViewController, walkViewController, friendsViewController]
    }
    
    func setup(vc: UIViewController, imageName: String) {
        let image = UIImage(named: imageName)
        let tabBarItem = UITabBarItem(title: "", image: image, selectedImage: image)
        vc.tabBarItem = tabBarItem
    }
    
    func setupTabBar() {
        self.rootViewController.tabBar.tintColor = UIColor(red: 29/255, green: 133/255, blue: 255/255, alpha: 1)
        self.rootViewController.tabBar.unselectedItemTintColor = UIColor(red: 217/255, green: 219/255, blue: 224/255, alpha: 1)
        
        
        let layerView = CAShapeLayer()
        
        layerView.path = UIBezierPath(roundedRect: CGRect(x: 0,
                                                          y: self.rootViewController.tabBar.bounds.minY - 14,
                                                          width: self.rootViewController.tabBar.bounds.width,
                                                          height: self.rootViewController.tabBar.bounds.height + 70), cornerRadius: 0).cgPath
        layerView.fillColor = UIColor(named: "borderColorEditText")?.cgColor
        
        let lineView = CAShapeLayer()
        
        lineView.path = UIBezierPath(roundedRect: CGRect(x: 0,
                                                         y: -14,
                                                         width: self.rootViewController.tabBar.bounds.width,
                                                         height: 1), cornerRadius: 0).cgPath
        lineView.fillColor = .init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        
        self.rootViewController.tabBar.layer.insertSublayer(layerView, at: 0)
        self.rootViewController.tabBar.layer.insertSublayer(lineView, at: 1)
        
        self.rootViewController.tabBar.itemWidth = self.rootViewController.tabBar.bounds.width / 3
        self.rootViewController.tabBar.itemPositioning = .centered
    }
    
}

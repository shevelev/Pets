//
//  MainTabBarController.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 21.09.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var viewModel: MainTabBarViewModel!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTab()
        setupTabItems()
 
        
    }
    
    
    fileprivate func setupTab() {
                self.tabBar.tintColor = UIColor(red: 29/255, green: 133/255, blue: 255/255, alpha: 1)
                self.tabBar.unselectedItemTintColor = UIColor(red: 217/255, green: 219/255, blue: 224/255, alpha: 1)
        

        
        
        let layerView = CAShapeLayer()
        
        layerView.path = UIBezierPath(roundedRect: CGRect(x: 0, y: self.tabBar.bounds.minY - 14, width: self.tabBar.bounds.width, height: self.tabBar.bounds.height + 70), cornerRadius: 0).cgPath
        layerView.fillColor = UIColor(named: "borderColorEditText")?.cgColor
        
        let lineView = CAShapeLayer()
        
        lineView.path = UIBezierPath(roundedRect: CGRect(x: 0, y: -14, width: self.tabBar.bounds.width, height: 1), cornerRadius: 0).cgPath
        lineView.fillColor = .init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        
        self.tabBar.layer.insertSublayer(layerView, at: 0)
        self.tabBar.layer.insertSublayer(lineView, at: 1)
        
        self.tabBar.itemWidth = tabBar.bounds.width / 3
        self.tabBar.itemPositioning = .centered

    }
    
    
    private func setupTabItems() {
        
        let profile = self.createNav(with: "Profiles", and: UIImage(named: "profileIcon"), vc: ProfileTabViewController())
        let walk = self.createNav(with: "Walk", and: UIImage(named: "walkIcon"), vc: WalkTabViewController())
        let friends = self.createNav(with: "Friends", and: UIImage(named: "friendsIcon"), vc: FriendsTabViewController())
        
        self.setViewControllers([profile, walk, friends], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: vc)
        
        //nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title + " title"
        
        return nav
    }
    
    
    
}

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
        

        
        
        let layer = CAShapeLayer()
        
        layer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: self.tabBar.bounds.minY - 14, width: self.tabBar.bounds.width, height: self.tabBar.bounds.height + 70), cornerRadius: 0).cgPath

        layer.fillColor = UIColor(named: "borderColorEditText")?.cgColor
        
        let layer2 = CAShapeLayer()
        
        layer2.path = UIBezierPath(roundedRect: CGRect(x: 0, y: -14, width: self.tabBar.bounds.width, height: 1), cornerRadius: 0).cgPath
        layer2.fillColor = .init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        
        self.tabBar.layer.insertSublayer(layer, at: 0)
        self.tabBar.layer.insertSublayer(layer2, at: 1)
        
        self.tabBar.itemWidth = tabBar.bounds.width / 3
        self.tabBar.itemPositioning = .centered

    }
    
    
    private func setupTabItems() {
        
        let profile = self.createNav(with: "Profiles", and: UIImage(systemName: "person.crop.circle"), vc: ProfileTabViewController())
        let walk = self.createNav(with: "Walk", and: UIImage(systemName: "pawprint.fill"), vc: WalkTabViewController())
        let friends = self.createNav(with: "Friends", and: UIImage(systemName: "person.3.fill"), vc: FriendsTabViewController())
        
        self.setViewControllers([profile, walk, friends], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        //nav.navigationBar.prefersLargeTitles = true
        nav.viewControllers.first?.navigationItem.title = title + " title"
        
        return nav
    }
    
    
    
}

//
//  ProfileTabViewController.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 21.09.2023.
//

import UIKit
import FirebaseAuth

class ProfileTabViewController: UIViewController {
    
    lazy var logOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("logout", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(logoutButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logOutButton)
        self.view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func logoutButtonPressed(_ sender: UIButton!) {
        do {
            try Auth.auth().signOut()
 
        } catch let error {
            print(error)
        }
    }
    
}

//
//  FriendsTabViewController.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 21.09.2023.
//

import UIKit
import FirebaseAuth

class FriendsTabViewController: UIViewController {
    
    private let logOutButton: UIButton = {
        let button = UIButton(type: .system)
            button.setTitle("logout", for: .normal)
        button.addTarget(self, action: #selector(logOut(_:)), for: .touchUpInside)
            return button
        }()
    
    @objc func logOut(_ sender: AnyObject) {
        do {
                   try Auth.auth().signOut()

               } catch let error {
                   print(error)
               }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        view.addSubview(logOutButton)
        logOutButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

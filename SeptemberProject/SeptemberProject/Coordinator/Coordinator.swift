//
//  Coordinator.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 14.09.2023.
//

import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? {get set}
    var children: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}

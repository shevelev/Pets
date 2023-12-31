//
//  AutorizationCoordinator.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 25.09.2023.
//

import UIKit

class AuthorizationCoordinator: Coordinator {
    
    var rootViewContoller = UINavigationController()
    
    func start() {
        let autorizetionViewModel = AuthorizationViewModel.init()
        autorizetionViewModel.coordinator = self
        let view = AuthorizationViewController()
        
        view.viewModel = autorizetionViewModel
        rootViewContoller.setViewControllers([view], animated: false)
    }
    
    func goToRestorePasswordPage() {
        let vc = RestorePasswordViewController()
        let vm = RestorePasswordViewModel.init()
        vm.coordinator = self
        vc.viewModel = vm
        rootViewContoller.pushViewController(vc, animated: true)
    }
    
    func goToRegistration() {

    }
    
    func goToBack() {
        rootViewContoller.popViewController(animated: true)
    }
    
    func goToMainTab() {
        rootViewContoller.viewControllers.removeAll()
        let main = MainTabCoordinator()
        main.start()
        rootViewContoller.pushViewController(main.rootViewController, animated: true)
    }
    
}

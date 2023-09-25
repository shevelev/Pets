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
        let view = AuthorizationViewController()
        let autorizetionViewModel = AuthorizationViewModel.init()
        autorizetionViewModel.coordinator = self
        
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
    
    func goToBack() {
        rootViewContoller.popViewController(animated: true)
    }
    
}

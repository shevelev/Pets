//
//  AppCoordinator.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 14.09.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navCon: UINavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        print("App Coordinator start")
        goToAutorizetionPage()
    }
    
    
    func goToAutorizetionPage() {
        let autorizetionViewController = AutorizetionViewController()
        let autorizetionViewModel = AutorizetionViewModel.init()
        autorizetionViewModel.coordinator = self
        autorizetionViewController.viewModel = autorizetionViewModel
        navigationController.pushViewController(autorizetionViewController, animated: true)
    }
    
    func goToRegistrationPage() {
        let registrationViewController = RegistrationViewController()
        navigationController.pushViewController(registrationViewController, animated: true)
    }
    
    func goToRestorePasswordPage() {
        let restorePasswordViewController = RestorePasswordViewController()
        let restorePasswordViewModel = RestorePasswordViewModel.init()
        restorePasswordViewModel.coordinator = self
        restorePasswordViewController.viewModel = restorePasswordViewModel
        navigationController.pushViewController(restorePasswordViewController, animated: true)
    }
}

//
//  AutorizetionViewModel.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 14.09.2023.
//

import Foundation

class AutorizetionViewModel {
    weak var coordinator: AppCoordinator!
    
    func goToRegister() {
        coordinator.goToRegistrationPage()
    }
    
    func goToRestorePassword() {
        coordinator.goToRestorePasswordPage()
    }
    
}

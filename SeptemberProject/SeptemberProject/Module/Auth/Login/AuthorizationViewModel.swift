//
//  AutorizetionViewModel.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 14.09.2023.
//

import Foundation

class AuthorizationViewModel {
    weak var coordinator: AuthorizationCoordinator!
    
    func goToRegistration() {
        coordinator.goToRegistration()
    }

    func goToRestorePassword() {
        coordinator.goToRestorePasswordPage()
    }
}

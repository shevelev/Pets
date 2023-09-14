//
//  RegistrationViewModel.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 14.09.2023.
//

import Foundation

class RegistrationViewModel {
    weak var coordinator: AppCoordinator!
    
    func goToLogin() {
        coordinator.goToAutorizetionPage()
    }
}

//
//  RestorePasswordViewModel.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 14.09.2023.
//

import Foundation

class RestorePasswordViewModel {
    weak var coordinator: AuthorizationCoordinator!

    func goToBack() {
       coordinator.goToBack()
    }
}


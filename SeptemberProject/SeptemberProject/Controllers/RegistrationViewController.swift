//
//  RegistrationViewController.swift
//  SeptemberProject
//
//  Created by Павел Широкий on 11.09.2023.
//

import UIKit

final class RegistrationViewController: UIViewController {

    private let nameTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Имя")
        return textField
    }()
    
    private let emailTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "E-mail")
        return textField
    }()
    
    private let placeTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Местоположение")
        return textField
    }()
    
    private let bioTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "О себе")
        return textField
    }()
    
    private let passTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Введите пароль")
        return textField
    }()
    
    private let pass2TextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Повторите пароль")
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

    }
    


}


// MARK: - Setting Views
private extension RegistrationViewController {
    func setupView() {
        addSubViews()
        
        setupLayouts()
    }
}

// MARK: - Setting
private extension RegistrationViewController {
    func addSubViews() {
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(placeTextField)
        view.addSubview(bioTextField)
        view.addSubview(passTextField)
        view.addSubview(pass2TextField)
    }
}

// MARK: - Layout
private extension RegistrationViewController {
    func setupLayouts() {
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
    }
}

//
//  RegistrationViewController.swift
//  SeptemberProject
//
//  Created by Павел Широкий on 11.09.2023.
//

import UIKit

final class RegistrationViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let nameTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Имя")
        return textField
    }()
    
    private let mobileTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Телефон")
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
        
       setupViews()

    }
}


// MARK: - Setting Views
private extension RegistrationViewController {
    func setupViews() {
        configureScrollView()
        configureContentView()
        configureNameTextField()
        configureEmailTextField()
        configurePlaceTextField()
        configureMobileTextField()
        configureBioTextFieald()
        configurePassTextField()
        configurePass2TextField()
    }
}

// MARK: - Layout
private extension RegistrationViewController {
    
    func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        view.addSubview(scrollView)
    }
    
    func configureContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        scrollView.addSubview(contentView)
    }
    
    func configureNameTextField() {
       // nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        contentView.addSubview(nameTextField)
    }
    func configureEmailTextField() {
     //   emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        contentView.addSubview(emailTextField)
    }
    
    func configurePlaceTextField() {
 //       placeTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        placeTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        contentView.addSubview(placeTextField)
    }
    
    func configureMobileTextField() {
//        mobileTextField.translatesAutoresizingMaskIntoConstraints = false
        mobileTextField.topAnchor.constraint(equalTo: placeTextField.bottomAnchor, constant: 20).isActive = true
        mobileTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        contentView.addSubview(mobileTextField)
    }
    
    func configureBioTextFieald() {
 //       bioTextField.translatesAutoresizingMaskIntoConstraints = false
        bioTextField.topAnchor.constraint(equalTo: mobileTextField.bottomAnchor, constant: 20).isActive = true
        bioTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        contentView.addSubview(bioTextField)
    }
    
    func configurePassTextField() {
  //      passTextField.translatesAutoresizingMaskIntoConstraints = false
        passTextField.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: 20).isActive = true
        passTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        contentView.addSubview(passTextField)
    }
    
    func configurePass2TextField() {
  //      pass2TextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 20).isActive = true
        pass2TextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        contentView.addSubview(pass2TextField)
    }
    
}

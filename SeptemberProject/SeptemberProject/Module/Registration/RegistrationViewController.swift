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
        let textField = CustomTextField(placeholder: "Имя", type: .none)
        return textField
    }()
    
    private let mobileTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Телефон", type: .none)
        return textField
    }()
    
    private let emailTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "E-mail", type: .none)
        return textField
    }()
    
    private let placeTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Местоположение", type: .none)
        return textField
    }()
    
    private let bioTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "О себе", type: .none)
        return textField
    }()
    
    private let passTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Введите пароль", type: .none)
        return textField
    }()
    
    private let pass2TextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Повторите пароль", type: .none)
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
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func configureNameTextField() {
       // nameTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameTextField)
        
        NSLayoutConstraint.activate([
        nameTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 400),
        nameTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
        nameTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    func configureEmailTextField() {
     //   emailTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
        emailTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
        emailTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configurePlaceTextField() {
 //       placeTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placeTextField)
        NSLayoutConstraint.activate([
        placeTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
        placeTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
        placeTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureMobileTextField() {
//        mobileTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mobileTextField)
        NSLayoutConstraint.activate([
        mobileTextField.topAnchor.constraint(equalTo: placeTextField.bottomAnchor, constant: 20),
        mobileTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
        mobileTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureBioTextFieald() {
 //       bioTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bioTextField)
        NSLayoutConstraint.activate([
        bioTextField.topAnchor.constraint(equalTo: mobileTextField.bottomAnchor, constant: 20),
        bioTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
        bioTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configurePassTextField() {
  //      passTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(passTextField)
        NSLayoutConstraint.activate([
        passTextField.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: 20),
        passTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
        passTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configurePass2TextField() {
  //      pass2TextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pass2TextField)
        NSLayoutConstraint.activate([
        pass2TextField.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 20),
        pass2TextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
        pass2TextField.heightAnchor.constraint(equalToConstant: 60),
        pass2TextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}

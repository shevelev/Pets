//
//  ViewController.swift
//  SeptemberProject
//
//  Created by Artur Imanbaev on 05.09.2023.
//

import UIKit

class ViewController: UIViewController {


    private let resetPassword: UILabel = {
        $0.text = "Восстановить пароль"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .red//UIColor(red: 130, green: 138, blue: 150, alpha: 1)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let enter: UILabel = {
        $0.text = "Вход"
        $0.font = .systemFont(ofSize: 22, weight: .medium)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let registration: UILabel = {
        $0.text = "Регистрация"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .red//UIColor(red: 130, green: 138, blue: 150, alpha: 1)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let background: UIImageView = {
        $0.image = UIImage(named: "backgroundAuth")
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private let bottomView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    lazy var nextButton: UIButton = {
        $0.backgroundColor = UIColor(named: "backgroundColorAuth")
        $0.tintColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Далее", for: .normal)
        return $0
    }(UIButton())
    
    lazy var emailTextField: UITextField = {
        $0.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        $0.placeholder = "E-mail"
        $0.borderStyle = .roundedRect
        
        return $0
    }(UITextField())
    
    lazy var passwordTextField: UITextField = {
        $0.frame = CGRect(x: 0, y: 70, width: 100, height: 50)
        $0.placeholder = "Пароль"
        $0.borderStyle = .roundedRect
        return $0
    }(UITextField())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColorAuth")
        view.addSubview(bottomView)
        bottomView.addSubview(enter)
        bottomView.addSubview(resetPassword)
        bottomView.addSubview(registration)
        bottomView.addSubview(background)
        bottomView.addSubview(emailTextField)
        bottomView.addSubview(passwordTextField)
        bottomView.addSubview(nextButton)
        

        setupUI()
        
    }
    
    func setupUI() {
        NSLayoutConstraint.activate([
  
            background.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomView.topAnchor.constraint(equalTo: background.bottomAnchor, constant: 0),
            
            resetPassword.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            resetPassword.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -32),

            registration.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16),
            registration.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -32),
            
            nextButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -70),
            nextButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 17),
            nextButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -17),
            nextButton.heightAnchor.constraint(equalToConstant: 30),

            enter.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 15),
            enter.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15),
            enter.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15),
            
//            passwordTextField.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: 0),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            emailTextField.heightAnchor.constraint(equalToConstant: 80),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 80),

        ])
    }
    

}

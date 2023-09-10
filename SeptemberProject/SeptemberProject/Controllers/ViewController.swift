//
//  ViewController.swift
//  SeptemberProject
//
//  Created by Artur Imanbaev on 05.09.2023.
//

import UIKit

class ViewController: UIViewController {


    private let resetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Восстановить пароль", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
       // $0.addTarget(self, action: #selector(restorePassword), for: .touchUpInside)
        return button
    }()
    
    private let enterLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Регистрация", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let backgroundTopImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backgroundAuth")
        image.backgroundColor = UIColor(named: "backgroundColorAuth")
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
       
        return image
    }()
    
    private let backgroundDogImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backgroundAuth-1")
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.zPosition = 10000
        return image
    }()
    
    private let lineImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Line3")
        image.contentMode = .center
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
       
        return image
    }()
    
    private let backgroundBottomImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rectangle150")
        //$0.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
       
        return image
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "backgroundColorAuth")
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Далее", for: .normal)
        button.layer.cornerRadius = 32
        button.layer.cornerCurve = .continuous
        button.addTarget(ViewController.self, action: #selector(restorePassword), for: .touchUpInside) //test
        return button
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "E-mail"
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor(named: "borderColorEditText")!.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.cornerCurve = .continuous
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Пароль"
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor(named: "borderColorEditText")!.cgColor
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 10
        textField.layer.cornerCurve = .continuous
        return textField
    }()
    
    private let stackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [])
        stack.axis  = .horizontal
        stack.distribution = .equalCentering
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.addSubview(backgroundTopImageView)
        view.addSubview(backgroundBottomImageView)
        view.addSubview(backgroundDogImageView)
        
        view.addSubview(enterLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(nextButton)

        view.addSubview(stackView)
        stackView.addArrangedSubview(resetPasswordButton)
        stackView.addArrangedSubview(lineImageView)
        stackView.addArrangedSubview(registrationButton)

        setupUI()
        
    }
    
    func setupUI() {
        NSLayoutConstraint.activate([
  
            backgroundTopImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundTopImageView.bottomAnchor.constraint(equalTo: backgroundBottomImageView.topAnchor, constant: 140),
            
            resetPasswordButton.widthAnchor.constraint(equalToConstant: (view.frame.size.width / 2) - 2),
            registrationButton.widthAnchor.constraint(equalToConstant: (view.frame.size.width / 2) - 2),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            stackView.heightAnchor.constraint(equalToConstant: 50),

            nextButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            
            enterLabel.topAnchor.constraint(equalTo: backgroundBottomImageView.topAnchor, constant: 45),
            enterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            enterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            emailTextField.topAnchor.constraint(equalTo: enterLabel.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 60),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60),

            backgroundBottomImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            backgroundBottomImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundBottomImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            backgroundDogImageView.bottomAnchor.constraint(equalTo: backgroundBottomImageView.topAnchor, constant: -10),
            backgroundDogImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2),
            backgroundDogImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            

        ])
    }
    
    
    @objc func restorePassword() {
        print("test \(Date())")
//        let vc = RestorePasswordViewController()
//        vc.navigationItem.largeTitleDisplayMode = .never
//        navigationController?.pushViewController(vc, animated: true)
    }

}

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
        $0.textColor = .red
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        //let tap = UITapGestureRecognizer(target: ViewController.self, action: #selector(restorePassword))
        //$0.isUserInteractionEnabled = true
        //$0.addGestureRecognizer(tap)
       // $0.addTarget(self, action: #selector(restorePassword), for: .touchUpInside)
        return $0
    }(UILabel())
    
    private let enter: UILabel = {
        $0.text = "Вход"
        $0.font = .systemFont(ofSize: 22, weight: .medium)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let registration: UILabel = {
        $0.text = "Регистрация"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .red
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let background: UIImageView = {
        $0.image = UIImage(named: "backgroundAuth")
        $0.contentMode = .scaleToFill
        $0.layer.masksToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
       
        return $0
    }(UIImageView())
    
    private let backgroundBottom: UIImageView = {
        $0.image = UIImage(named: "rectangle150")
        //$0.contentMode = .scaleToFill
        $0.layer.masksToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
       
        return $0
    }(UIImageView())
    
    private let bottomView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = true
        return $0
    }(UIView())
    
    private let textFieldsView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.isUserInteractionEnabled = true
        return $0
    }(UIView())
    
    lazy var nextButton: UIButton = {
        $0.backgroundColor = UIColor(named: "backgroundColorAuth")
        $0.setTitleColor(.white, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Далее", for: .normal)
        $0.layer.cornerRadius = 32
        $0.layer.cornerCurve = .continuous
        $0.addTarget(self, action: #selector(restorePassword), for: .touchUpInside) //test
        return $0
    }(UIButton())
    
    lazy var emailTextField: UITextField = {
        $0.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width-32, height: 59)
        $0.placeholder = "E-mail"
        $0.borderStyle = .roundedRect
        $0.layer.cornerRadius = 10
        $0.layer.cornerCurve = .continuous
        return $0
    }(UITextField())
    
    lazy var passwordTextField: UITextField = {
        $0.frame = CGRect(x: 0, y: 66, width: self.view.frame.size.width-32, height: 59)
        $0.placeholder = "Пароль"
        $0.borderStyle = .roundedRect
        $0.isSecureTextEntry = true
        $0.layer.cornerRadius = 10
        $0.layer.cornerCurve = .continuous
        return $0
    }(UITextField())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColorAuth")
        //view.layer.zPosition = 0
        
        view.addSubview(background)
        view.addSubview(bottomView)
        
        bottomView.addSubview(backgroundBottom)
        bottomView.addSubview(textFieldsView)
        
        textFieldsView.addSubview(enter)
        textFieldsView.addSubview(emailTextField)
        textFieldsView.addSubview(passwordTextField)
        textFieldsView.addSubview(nextButton)
        textFieldsView.layer.zPosition = 100

        
        bottomView.addSubview(resetPassword)
        bottomView.addSubview(registration)

        
        
        

        setupUI()
        
    }
    
    func setupUI() {
        NSLayoutConstraint.activate([
  
            background.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            background.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: 140),
            
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomView.topAnchor.constraint(equalTo: background.bottomAnchor, constant: -140),
            
            resetPassword.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            resetPassword.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -32),

            registration.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16),
            registration.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -32),
//
            nextButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            nextButton.leadingAnchor.constraint(equalTo: textFieldsView.leadingAnchor, constant: 0),
            nextButton.trailingAnchor.constraint(equalTo: textFieldsView.trailingAnchor, constant: 0),
            nextButton.heightAnchor.constraint(equalToConstant: 60),

            //textFieldsView.topAnchor.constraint(equalTo: enter.bottomAnchor, constant: 16),
            textFieldsView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            textFieldsView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16),
            textFieldsView.heightAnchor.constraint(equalToConstant: 200),
            
            
            enter.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 45),
            enter.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15),
            enter.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15),
            
            emailTextField.topAnchor.constraint(equalTo: enter.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: textFieldsView.leadingAnchor, constant: 0),
            emailTextField.trailingAnchor.constraint(equalTo: textFieldsView.trailingAnchor, constant: 0),
//
//
            passwordTextField.leadingAnchor.constraint(equalTo: textFieldsView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: textFieldsView.trailingAnchor, constant: 16),
//
            backgroundBottom.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 0),
            backgroundBottom.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 0),
            backgroundBottom.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: 0)
            

        ])
    }
    
    
    @objc func restorePassword() {
        print("test")
        let vc = RestorePasswordController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

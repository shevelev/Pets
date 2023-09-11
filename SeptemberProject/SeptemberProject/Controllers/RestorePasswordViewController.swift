//
//  RestorePasswordController.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 08.09.2023.
//

import UIKit

class RestorePasswordViewController: UIViewController {
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "backgroundColorAuth")
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Отправить код", for: .normal)
        button.layer.cornerRadius = 32
        button.layer.cornerCurve = .continuous
        button.addTarget(RestorePasswordViewController.self, action: #selector(sendCode), for: .touchUpInside) //test
        return button
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Пожалуйста, укажите e-mail, который вы использовали для входа в Petapp для того чтобы мы напомнили ваш пароль."
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "E-mail")
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Напомнить пароль"
       
        view.addSubview(signInButton)
        view.addSubview(descriptionLabel)
        view.addSubview(emailTextField)
        setConstraints()
    }
    
    @objc private func sendCode() {
      print("send code")
        let vc = AutorizetionViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        print("2")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            emailTextField.widthAnchor.constraint(equalToConstant: 100),
            emailTextField.heightAnchor.constraint(equalToConstant: 60),
            emailTextField.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -20),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            signInButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 60),
            signInButton.widthAnchor.constraint(equalToConstant: 212)
        ])
    }
}

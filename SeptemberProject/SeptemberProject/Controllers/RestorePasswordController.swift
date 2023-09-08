//
//  RestorePasswordController.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 08.09.2023.
//

import UIKit

class RestorePasswordController: UIViewController {
    
    lazy var signInButton: UIButton = {
        $0.backgroundColor = UIColor(named: "backgroundColorAuth")
        $0.setTitleColor(.white, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Отправить код", for: .normal)
        $0.layer.cornerRadius = 32
        $0.layer.cornerCurve = .continuous
        $0.addTarget(self, action: #selector(sendCode), for: .touchUpInside) //test
        return $0
    }(UIButton())
    
    private let text: UILabel = {
        $0.text = "Пожалуйста, укажите e-mail, который вы использовали для входа в Petapp для того чтобы мы напомнили ваш пароль."
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .gray
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var emailTextField: UITextField = {
        $0.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width-32, height: 59)
        $0.placeholder = "E-mail"
        $0.borderStyle = .roundedRect
        $0.layer.cornerRadius = 10
        $0.layer.cornerCurve = .continuous
        $0.isUserInteractionEnabled = true
        return $0
    }(UITextField())
    
    private let viewWithPadding: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.isUserInteractionEnabled = true
        
        return $0
    }(UIView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(viewWithPadding)
        
        viewWithPadding.addSubview(signInButton)
        viewWithPadding.addSubview(text)
        viewWithPadding.addSubview(emailTextField)
        setConstraints()
    }
    
    @objc func sendCode() {
      print("send code")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            viewWithPadding.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewWithPadding.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewWithPadding.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewWithPadding.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            viewWithPadding.heightAnchor.constraint(equalToConstant: 200),//view.frame.self.height),
   

            text.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            signInButton.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 20),
            signInButton.centerXAnchor.constraint(equalTo: viewWithPadding.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 60),
            signInButton.widthAnchor.constraint(equalToConstant: 212)
        ])
    }
}

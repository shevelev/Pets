//
//  ViewController.swift
//  SeptemberProject
//
//  Created by Artur Imanbaev on 05.09.2023.
//

import UIKit
import Firebase
class AuthorizationViewController: UIViewController {
    
    var viewModel = AuthorizationViewModel()
    
    //MARK: buttons
    
    lazy var resetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(K.viewControllerText.resetPasswordButtonText.rawValue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(resetPasswordButtonPressed(_:)), for: .touchUpInside) //test
        return button
    }()
    
    lazy var registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(K.viewControllerText.registrationButtonText.rawValue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registrationButtonPressed(_:)), for: .touchUpInside) //test
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "backgroundColorAuth")
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(K.viewControllerText.nextButtonText.rawValue, for: .normal)
        button.layer.cornerRadius = 32
        button.layer.cornerCurve = .continuous
        button.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside) //test
        return button
    }()
    
    //MARK: labels
    private let enterLabel: UILabel = {
        let label = UILabel()
        label.text = K.viewControllerText.enterLabelText.rawValue
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: textFields
    private let emailTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "E-mail", type: .email)//CustomFloatingTextField(placeholder: "E-mail", type: .email)
        return textField
    }()
    
    private let passwordTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Пароль", type: .pass)
        //textField.isSecureTextEntry = true
        return textField
    }()
    
    //MARK: imageViews
    private let backgroundTopImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backgroundAuth")
        image.backgroundColor = UIColor(named: "backgroundColorAuth")
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
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
        image.image = UIImage(named: "Rectangle150")
        //$0.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //MARK: StackViews
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
        setConstraintsBackgroundImage()
        setConstraintsButtons()
        setConstraintsEditTexts()
        setConstraintsLabels()
        setConstraintsStack()
    }
    
    private func setConstraintsBackgroundImage() {
        NSLayoutConstraint.activate([
            backgroundTopImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundTopImageView.bottomAnchor.constraint(equalTo: backgroundBottomImageView.topAnchor, constant: 140),
            
            backgroundBottomImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            backgroundBottomImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundBottomImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
        ])
    }
    
    private func setConstraintsButtons() {
        NSLayoutConstraint.activate([
            resetPasswordButton.widthAnchor.constraint(equalToConstant: (view.frame.size.width / 2) - 2),
            registrationButton.widthAnchor.constraint(equalToConstant: (view.frame.size.width / 2) - 2),
            
            nextButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func setConstraintsEditTexts() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: enterLabel.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 60),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func setConstraintsLabels() {
        NSLayoutConstraint.activate([
            enterLabel.topAnchor.constraint(equalTo: backgroundBottomImageView.topAnchor, constant: K.constraint.a45.rawValue),
            enterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: K.constraint.a15.rawValue),
            enterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -K.constraint.a15.rawValue),
            
            
        ])
    }
    
    private func setConstraintsStack() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: K.constraint.a0.rawValue),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: K.constraint.a0.rawValue),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -K.constraint.a25.rawValue),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    

    //MARK: ButtonsPressed
    
    @objc func resetPasswordButtonPressed(_ sender: UIButton!) {
        viewModel.goToRestorePassword()
    }
    
    @objc func registrationButtonPressed(_ sender: UIButton!) {
        print("registrationButtonPressed \(Date())")
    }
    
    @objc func nextButtonPressed(_ sender: UIButton!) {

        viewModel.signIn(email: emailTextField.getValue(), password: passwordTextField.getValue())
    }

}

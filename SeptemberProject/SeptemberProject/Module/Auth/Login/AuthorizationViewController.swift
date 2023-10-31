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
        button.addTarget(self, action: #selector(resetPasswordButtonPressed(_:)), for: .touchUpInside) //test
        return button
    }()
    
    lazy var registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(K.viewControllerText.registrationButtonText.rawValue, for: .normal)
        button.addTarget(self, action: #selector(registrationButtonPressed(_:)), for: .touchUpInside) //test
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "backgroundColorAuth")
        button.setTitleColor(.white, for: .normal)
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
        return label
    }()
    
    //MARK: textFields
    private let emailTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "E-mail", type: .email)//CustomFloatingTextField(placeholder: "E-mail", type: .email)
        return textField
    }()
    
    private let passwordTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Пароль", type: .pass)
        return textField
    }()
    
    //MARK: imageViews
    private let backgroundTopImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backgroundAuth")
        image.backgroundColor = UIColor(named: "backgroundColorAuth")
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        
        return image
    }()
    
    private let lineImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Line3")
        image.contentMode = .center
        image.layer.masksToBounds = true
        
        return image
    }()
    
    private let backgroundBottomImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Rectangle150")
        image.layer.masksToBounds = true
        
        return image
    }()
    
    //MARK: StackViews
    private let stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [])
        stack.axis  = .horizontal
        stack.distribution = .equalCentering
        stack.alignment = .center
        
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
        backgroundTopImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(backgroundBottomImageView.snp.top).offset(140)
        }
        
        backgroundBottomImageView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setConstraintsButtons() {
        resetPasswordButton.snp.makeConstraints { make in
            make.width.equalTo((view.frame.size.width / 2) - 2)
        }
        
        registrationButton.snp.makeConstraints { make in
            make.width.equalTo((view.frame.size.width / 2) - 2)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(60)
        }
    }
    
    private func setConstraintsEditTexts() {
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(enterLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(60)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(60)
        }
    }
    
    private func setConstraintsLabels() {
        enterLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundBottomImageView.snp.top).offset(45)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setConstraintsStack() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-25)
        }
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

//
//  RestorePasswordController.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 08.09.2023.
//

import UIKit

class RestorePasswordViewController: UIViewController {
    
    var viewModel: RestorePasswordViewModel!
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "backgroundColorAuth")
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Отправить код", for: .normal)
        button.layer.cornerRadius = 32
        button.layer.cornerCurve = .continuous
        button.addTarget(self, action: #selector(sendCode), for: .touchUpInside)
        return button
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Пожалуйста, укажите e-mail, который вы использовали для входа в Petapp для того чтобы мы напомнили ваш пароль."
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let emailTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "E-mail", type: .email)
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Напомнить пароль"
       
        view.addSubview(signInButton)
        view.addSubview(descriptionLabel)
        view.addSubview(emailTextField)
        
        setupNavItem()
        setConstraints()
    }
    
    @objc private func sendCode() {
        viewModel.resetPaassWord(email: emailTextField.getValue())
    }
    
    @objc private func goToBack() {
        viewModel.goToBack()
    }
    
    private func setupNavItem() {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.left")?.withTintColor(UIColor(red: 117/255, green: 127/255, blue: 140/255, alpha: 1), renderingMode: .alwaysOriginal)
        //image?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 17
        button.layer.cornerCurve = .continuous
        button.backgroundColor = UIColor(ciColor: .white)
        button.frame.size.width = 34
        button.frame.size.height = 34
        button.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(goToBack), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }

    private func setConstraints() {
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-30)
            make.height.equalTo(60)
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().offset(-40)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(212)
        }
    }
}

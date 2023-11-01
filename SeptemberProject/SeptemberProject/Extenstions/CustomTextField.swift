//
//  CustomView.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 20.09.2023.
//

import UIKit

final class CustomTextField: UIView {
    
    /// Description
    ///     email - regex
    ///     phone - format  +1 (234) 567 89-01
    ///     pass - security hide/nohide
    enum TypeTextField {
        case email
        case phone
        case none
        case pass
    }
    
    class Constants {
        static let correctlyBorderColor = UIColor(red: 29/255, green: 133/255, blue: 255/255, alpha: 1)
        static let correctlyTextColor = UIColor(red: 31/255, green: 34/255, blue: 52/255, alpha: 1)
        static let notCorrectlyColor = UIColor(red: 250/255, green: 46/255, blue: 105/255, alpha: 1)
        static let defaultColor = UIColor(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
    }
    
    private var labelText: String = ""
    private var type: TypeTextField = .none
    private var isCorrectly: Bool = false
    
    //MARK: -- elements
    private let stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [])
        stack.axis  = .horizontal
        stack.alignment = .center
        return stack
    }()
    
    private let floatingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        return label
    }()
    
    private var floatingText: UITextField = {
        let textField = UITextField()
        textField.textColor = .gray
        textField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        textField.addTarget(self, action: #selector(editTextChanged), for: .editingChanged)
        return textField
    }()
    
    // MARK:- FloatingLabel
    @objc func editTextChanged() {
        setupFloatingLabel()
    }
    
    private func setupFloatingLabel() {
        let size = floatingText.text?.count ?? 0
        
        if size > 0 {
            check()
            floatingLabel.text = "Введите \(labelText)"
            floatingText.text = floatingText.text?.lowercased()
            if isCorrectly {
                layer.borderColor = Constants.correctlyBorderColor.cgColor
                floatingText.textColor = Constants.correctlyTextColor
            } else {
                layer.borderColor = Constants.notCorrectlyColor.cgColor
                floatingText.textColor = Constants.notCorrectlyColor
            }
        } else if size == 0 {
            reset()
        }
    }
    
    private func makeConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(15)
            make.top.equalTo(self.snp.top).offset(11)
            make.trailing.equalTo(self.snp.trailing).offset(-15)
            make.bottom.equalTo(self.snp.bottom).offset(-11)
        }
        
        floatingLabel.snp.makeConstraints { make in
            make.leading.equalTo(stackView.snp.leading)
            make.trailing.equalTo(stackView.snp.trailing)
            make.top.equalTo(stackView.snp.top).offset(0)
        }
       
        floatingText.snp.makeConstraints { make in
            make.leading.equalTo(stackView.snp.leading)
            make.trailing.equalTo(stackView.snp.trailing)
        }
    }
    
    private func reset() {
        floatingLabel.text = ""
        layer.borderColor = Constants.defaultColor.cgColor
    }
    
    init(placeholder: String, type: TypeTextField) {
        super.init(frame: .zero)
        
        self.labelText = placeholder
        floatingText.placeholder = placeholder
        self.type = type
        
        setupUI()
        makeConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLayer() {
        layer.cornerRadius = 10
        layer.cornerCurve = .continuous
        layer.backgroundColor = UIColor.white.cgColor
        layer.borderColor =  Constants.defaultColor.cgColor
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "borderColorEditText")!.cgColor
    }
    
    private func setupUI() {
        
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(floatingLabel)
        stackView.addArrangedSubview(floatingText)
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        
        setupLayer()
        
        if self.type == .pass {
            floatingText.isSecureTextEntry = true
        }
    }
    
    //MARK: -- Проверка различных типов поля
    private func check() {
        switch type {
        case .email:
            self.isCorrectly = isValidEmail()
        case .phone:
            self.isCorrectly = true
        case .pass:
            self.isCorrectly = true
        case .none:
            self.isCorrectly = true
        }
    }
    
    private func isValidEmail() -> Bool {
        let emailRegEx = "^(?!\\.)([A-Z0-9a-z_%+-]?[\\.]?[A-Z0-9a-z_%+-])+@[A-Za-z0-9-]{1,20}(\\.[A-Za-z0-9]{1,15}){0,10}\\.[A-Za-z]{2,20}$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: floatingText.text)
    }
    
    func getValue() -> String {
        floatingText.text ?? ""
    }
}

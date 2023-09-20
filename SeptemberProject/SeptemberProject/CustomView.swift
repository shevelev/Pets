//
//  CustomView.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 20.09.2023.
//

import UIKit

final class CustomView: UIView {
    
    enum typeTextField {
        case email //regex check
        case phone //format +* (***) *** **-**
        case none
    }
    
    private var labelText: String = ""
    private var type: typeTextField = .none
    private var isCorrectly: Bool = false
    private var labelTopCon: CGFloat = 0
    private var textTopCon: CGFloat = 0
    
    
    //MARK: -- elements
    
    private let stackView: UIStackView = {
           let stack = UIStackView(arrangedSubviews: [])
           stack.axis  = .horizontal
           //stack.distribution = .fillEqually
           stack.alignment = .center
           stack.translatesAutoresizingMaskIntoConstraints = false
//           stack.spacing = 5
        //stack.backgroundColor = .red
           return stack
       }()
    
    private let floatingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.backgroundColor = .yellow
        return label
    }()
    
    private var floatingText: UITextField = {
        let textField = UITextField()
        //textField.placeholder = "test2"
        textField.textColor = .gray
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        //textField.backgroundColor = .green
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
                layer.borderColor = UIColor(red: 29/255, green: 133/255, blue: 255/255, alpha: 1).cgColor
                floatingText.textColor = UIColor(red: 31/255, green: 34/255, blue: 52/255, alpha: 1)
            } else {
                layer.borderColor = UIColor(red: 250/255, green: 46/255, blue: 105/255, alpha: 1).cgColor
                floatingText.textColor = UIColor(red: 250/255, green: 46/255, blue: 105/255, alpha: 1)
            }
            
//            labelTopCon = 15
//            textTopCon = 5
//            updateConst()
            
        } else if size == 0 {
            reset()
        }
    }
    
    
    private func updateConst() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 60),
            //floatingLabel.heightAnchor.constraint(equalToConstant: 15),
            
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 11),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -11),
            
            floatingLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            floatingLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            floatingLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: labelTopCon),
            
            floatingText.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            floatingText.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            floatingText.topAnchor.constraint(equalTo: floatingLabel.bottomAnchor, constant: textTopCon)
            
        ])
    }
    
    private func reset() {
        floatingLabel.text = ""
        labelTopCon = 0
        textTopCon = 0
        layer.borderColor = UIColor(red: 237/255, green: 237/255, blue: 240/255, alpha: 1).cgColor
//        updateConst()
    }
    
    init(placeholder: String, type: typeTextField) {
        super.init(frame: .zero)
        
        self.labelText = placeholder
        floatingText.placeholder = placeholder
        self.type = type
        
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(floatingLabel)
        stackView.addArrangedSubview(floatingText)
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        
        layer.cornerRadius = 10
        layer.cornerCurve = .continuous
        layer.backgroundColor = UIColor.white.cgColor
        layer.borderColor =  UIColor(red: 237/255, green: 237/255, blue: 240/255, alpha: 1).cgColor
        layer.borderWidth = 1
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor = UIColor(named: "borderColorEditText")!.cgColor
        
        updateConst()
     
    }
    
    //MARK: -- Проверка различных типов поля
    private func check() {
        switch self.type {
        case .email:
            self.isCorrectly = isValidEmail()
        case .phone:
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
    
    override func resignFirstResponder() -> Bool {
        print("2")
        return super.resignFirstResponder()
    }
 
}

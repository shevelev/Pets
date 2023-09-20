//
//  CustomFloatingTextField.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 18.09.2023.
//

import UIKit



final class CustomFloatingTextField: UITextField {
    
    enum typeTextField {
        case email //regex check
        case phone //format +* (***) *** **-**
        case none
    }
    
    private var labelHeight: CGFloat = 0
    //var padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 20)
    private var labelText: String = ""
    private var type: typeTextField = .none
    private var isCorrectly: Bool = false
    
    init(placeholder: String, type: typeTextField) {
        super.init(frame: .zero)
        self.labelText = placeholder
        self.type = type
        setupTextField()
        self.addTarget(self, action: #selector(editTextChanged), for: .editingChanged)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = CGRect(x: 15, y: 0, width: bounds.size.width, height: bounds.size.height - labelHeight)
        return rect
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let rect = CGRect(x: 15, y: 0, width: bounds.size.width, height: bounds.size.height )
        return rect
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = CGRect(x: 15, y: labelHeight, width: bounds.size.width, height: bounds.size.height - labelHeight)
        return rect
    }
    
    private func setupTextField() {
        textColor = .gray
        layer.cornerRadius = 10
        layer.cornerCurve = .continuous
        layer.backgroundColor =  .init(red: 255, green: 255, blue: 255, alpha: 1)
        layer.borderWidth = 1
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor = UIColor(named: "borderColorEditText")!.cgColor
        
        attributedPlaceholder = NSAttributedString(string: labelText)
    }
    
    // MARK:- FloatingLabel
    @objc func editTextChanged() {
        setupFloatingLabel()
    }
    
    private lazy var labelTextField: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 1
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func reset() {
        labelTextField.text = ""
        labelHeight = 0
        layer.borderColor = UIColor.clear.cgColor
        textColor = .clear
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
          return emailPred.evaluate(with: text)
     }
    
    private func setupFloatingLabel() {
        
        let size = self.text?.count ?? 0
        
        if size > 0 {
            check()
            labelHeight = 20
            labelTextField.text = "Введите \(labelText)"
            text = text?.lowercased()
            if isCorrectly {
                layer.borderColor = UIColor(red: 29/255, green: 133/255, blue: 255/255, alpha: 1).cgColor
                textColor = UIColor(red: 31/255, green: 34/255, blue: 52/255, alpha: 1)
            } else {
                layer.borderColor = UIColor(red: 250/255, green: 46/255, blue: 105/255, alpha: 1).cgColor
                textColor = UIColor(red: 250/255, green: 46/255, blue: 105/255, alpha: 1)
            }
            
            
        } else if size == 0 {
            reset()
        }
        
        self.addSubview(labelTextField)
        NSLayoutConstraint.activate([
            labelTextField.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            labelTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15)
        ])
    }
    
    override func becomeFirstResponder() -> Bool {
        print("1")
        return super.becomeFirstResponder()
        
    }
    
    override func resignFirstResponder() -> Bool {
        print("2")
        return super.resignFirstResponder()
    }
    
    
}

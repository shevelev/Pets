//
//  CustomFloatingTextField.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 18.09.2023.
//

import UIKit

final class CustomFloatingTextField: UITextField {
    
    var labelHeight: CGFloat = 0
    var padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 20)
    
    
    init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
         self.addTarget(self, action: #selector(editTextChanged), for: .editingChanged)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        bounds.inset(by: padding)
        let rect = CGRect(x: 15, y: 0, width: bounds.size.width, height: bounds.size.height - labelHeight)
        return rect
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//        bounds.inset(by: padding)
        let rect = CGRect(x: 15, y: 0, width: bounds.size.width, height: bounds.size.height )
        return rect
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        //bounds.inset(by: padding)
        //labelHeight = 15
        bounds.inset(by: padding)
        let rect = CGRect(x: 15, y: labelHeight, width: bounds.size.width, height: bounds.size.height - labelHeight)
        return rect
    }

    private func setupTextField(placeholder: String) {
        textColor = .gray
        layer.cornerRadius = 10
        layer.cornerCurve = .continuous
        layer.backgroundColor =  .init(red: 255, green: 255, blue: 255, alpha: 1)
        layer.borderWidth = 1
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor = UIColor(named: "borderColorEditText")!.cgColor

        attributedPlaceholder = NSAttributedString(string: placeholder)
    }
    
    // MARK:- FloatingLabel
    
    @objc func editTextChanged() {
        setupFloatingLabel(placeholder: "Введите e-mail")
        padding = UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 20)
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
    }
    
    private func setupFloatingLabel(placeholder: String) {
    
        let size = self.text?.count ?? 0
        print(size)
        if size > 0 {
            labelHeight = 20
            labelTextField.text = placeholder

        } else if size == 0 {
            reset()
        }

        
         self.addSubview(labelTextField)
         NSLayoutConstraint.activate([
         
             labelTextField.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 25),
             labelTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15)
         
         ])
         

        
    }
}

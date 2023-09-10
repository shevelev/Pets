//
//  CustomTextField.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 10.09.2023.
//

import UIKit

final class CustomTextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
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
}

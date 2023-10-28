//
//  CustomPageControl.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 08.10.2023.
//

import UIKit
import SnapKit

protocol CustomPageControlDelegate: AnyObject {
    func updateCurrentSlide(slide: Int)
}

class CustomPageControl: UIView {
    
    weak var delegate: CustomPageControlDelegate?
    
    private var dots: [UIView] = []
    
    private let stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [])
        stack.axis  = .horizontal
        stack.spacing = 5
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    var numberOfPages: Int = 0 {
        didSet {
            makeDots()
        }
    }
    
    var currentPage: Int = 0 {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    private func updateView() {
        print("update view \(currentPage)")
        
        var widthAnchor: NSLayoutConstraint?
        
        dots.forEach { dot in
            let tag = dot.tag
            let viewTag = currentPage
                
            dot.constraints.forEach { const in
                dot.removeConstraint(const)
            }

            dot.backgroundColor = viewTag == tag ? UIColor(red: 29/255, green: 133/255, blue: 255/255, alpha: 1) : UIColor(red: 217/255, green: 219/255, blue: 224/255, alpha: 1)
            widthAnchor = viewTag == tag ? dot.widthAnchor.constraint(equalToConstant: 20) : dot.widthAnchor.constraint(equalToConstant: 10)

            widthAnchor?.isActive = true
            dot.heightAnchor.constraint(equalToConstant: 10).isActive = true
        }
    }
    
    private func makeDots() {
        for tag in 0..<numberOfPages {
            let dot = UIView()
            dot.tag = tag
            
//            dot.translatesAutoresizingMaskIntoConstraints = false
//            dot.widthAnchor.constraint(equalToConstant: 10).isActive = true
            
            dot.snp.makeConstraints { make in
                make.width.equalTo(10)
            }
            
            dot.backgroundColor = UIColor(red: 217/255, green: 219/255, blue: 224/255, alpha: 1)
            dot.layer.cornerRadius = 5
            dot.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(scrollToCell(sender: ))))
            stackView.addArrangedSubview(dot)
            self.dots.append(dot)
        }
    }
    
    @objc func scrollToCell(sender: UIGestureRecognizer) {
        self.delegate?.updateCurrentSlide(slide: sender.view?.tag ?? 0)
    }
}

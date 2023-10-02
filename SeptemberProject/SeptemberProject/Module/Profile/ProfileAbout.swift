//
//  ProfileAbout.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 01.10.2023.
//

import UIKit

class ProfileAbout: UIView {
    
    func configure(with model: String) {
        // Настройка всех полей (свой/чужой профиль и данные из него)
    }
    
    private enum UIConstants {
        static let aboutLabelText = "О себе"
        static let descriptionLabelText = "Если пусто то надпись, чтобы нажали для редактирования."
        static let cornerRadius: CGFloat = 20
        static let contentPadding: CGFloat = 20
        static let editIconImagePadding: CGFloat = 15
        static let editIconImageSize: CGFloat = 11
        static let aboutLabelTextSize: CGFloat = 13
        static let descriptionLabelTextSize: CGFloat = 16
        static let descriptionLabelTopPadding: CGFloat = 10
        static let textColor: UIColor = UIColor(red: 130/255, green: 138/255, blue: 150/255, alpha: 1)
        static let headerTextColor: UIColor = UIColor(red: 31/255, green: 34/255, blue: 52/255, alpha: 1)
    }
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: UIConstants.aboutLabelTextSize, weight: .semibold)
        label.textColor = UIConstants.headerTextColor
        label.text = UIConstants.aboutLabelText
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = UIConstants.descriptionLabelText
        label.font = .systemFont(ofSize: UIConstants.descriptionLabelTextSize, weight: .light)
        label.textColor = UIConstants.textColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let editIconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "editIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
}

// MARK: - private methods
private extension ProfileAbout {
    func initialize() {

        backgroundColor = UIColor.white
        layer.cornerRadius = UIConstants.cornerRadius
        
        addSubview(aboutLabel)
        addSubview(descriptionLabel)
        addSubview(editIconImage)
        
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.contentPadding),
            aboutLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIConstants.contentPadding),
            
            descriptionLabel.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: UIConstants.descriptionLabelTopPadding),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIConstants.contentPadding),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: UIConstants.contentPadding),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIConstants.contentPadding),
            
            editIconImage.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.editIconImagePadding),
            editIconImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIConstants.editIconImagePadding),
            editIconImage.widthAnchor.constraint(equalToConstant: UIConstants.editIconImageSize),
            editIconImage.heightAnchor.constraint(equalToConstant: UIConstants.editIconImageSize)
        ])
    }
}

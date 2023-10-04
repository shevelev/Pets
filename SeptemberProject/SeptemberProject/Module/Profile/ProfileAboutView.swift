//
//  ProfileAbout.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 01.10.2023.
//

import UIKit

class ProfileAboutView: UIView {
    
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
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Human) {
        descriptionLabel.text = model.bioAbout.isEmpty ? "Нажмите для заполнения" : model.bioAbout
        editIconImage.isHidden = !model.bioAbout.isEmpty
    }
}

// MARK: - private methods
private extension ProfileAboutView {
    func initialize() {
        
        setupLayer()
        
        addSubview(aboutLabel)
        addSubview(descriptionLabel)
        addSubview(editIconImage)
        
        makeConstraintsAboutLabel()
        makeConstraintsDescriptionLabel()
        makeConstraintsEditIconImage()
    }
    
    private func setupLayer() {
        backgroundColor = UIColor.white
        layer.cornerRadius = UIConstants.cornerRadius
    }
    
    private func makeConstraintsAboutLabel() {
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.contentPadding),
            aboutLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIConstants.contentPadding),
        ])
    }
    private func makeConstraintsDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: UIConstants.descriptionLabelTopPadding),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIConstants.contentPadding),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: UIConstants.contentPadding),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIConstants.contentPadding),
        ])
    }
    private func makeConstraintsEditIconImage() {
        NSLayoutConstraint.activate([
            editIconImage.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.editIconImagePadding),
            editIconImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIConstants.editIconImagePadding),
            editIconImage.widthAnchor.constraint(equalToConstant: UIConstants.editIconImageSize),
            editIconImage.heightAnchor.constraint(equalToConstant: UIConstants.editIconImageSize)
        ])
    }
}

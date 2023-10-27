//
//  ProfilePetsCell.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 08.10.2023.
//

import UIKit

class ProfilePetsCell: UICollectionViewCell {

    private enum UIConstants {
        static let aboutLabelText = "О питомце"
        static let descriptionLabelText = "Если пусто то надпись, чтобы нажали для редактирования."
        static let petNameLabelText = "Арчи"
        static let petLocationLabelText = "Алтайский край, Барнаул"
        static let petAvatarPadding: CGFloat = 20
        static let petAvatarSize: CGFloat = 80
        static let aboutLabelTextSize: CGFloat = 13
        static let descriptionLabelTextSize: CGFloat = 16
        static let descriptionLabelTopPadding: CGFloat = 10
        static let editIconImagePadding: CGFloat = 15
        static let editIconImageSize: CGFloat = 11
        static let contentPadding: CGFloat = 20
        static let petNameLabelTextSize: CGFloat = 22
        static let petLocationLabelTextSize: CGFloat = 13
        static let textColor: UIColor = UIColor(red: 130/255, green: 138/255, blue: 150/255, alpha: 1)
        static let headerTextColor: UIColor = UIColor(red: 31/255, green: 34/255, blue: 52/255, alpha: 1)
        static let petStackViewLeadingPadding: CGFloat = 10
        static let collectionViewHeight: CGFloat = 106
        static let petLocationLabelTrailingPadding: CGFloat = 5
        static let petNameLabelTrailingPadding: CGFloat = -2
        static let genderPetImageTopPadding: CGFloat = -2
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with name: TestPet) {
        aboutLabel.text = name.name
        descriptionLabel.text = name.bioAbout
    }
}

private extension ProfilePetsCell {
    func initialize() {
        addSubview(aboutLabel)
        addSubview(descriptionLabel)
        
        makeConstraintsAboutLabel()
        makeConstraintsDescriptionLabel()
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
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIConstants.contentPadding),
        ])
    }
}

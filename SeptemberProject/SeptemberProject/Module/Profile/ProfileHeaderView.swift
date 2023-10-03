//
//  ProfileHeader.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 01.10.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private enum UIConstants {
        static let bigAvatarSize: CGFloat = 118
        static let smallAvatarSize: CGFloat = 80
        static let paddingContent: CGFloat = 20
        static let buttonHeight: CGFloat = 46
        static let buttonTitle: String = "Настройки"
        static let buttonCornerRadius = buttonHeight / 2
        static let buttonBorderWidth: CGFloat = 1
        static let buttonBackgroundColor: UIColor = .white
        static let nameLabelText: String = "Хозяин и питомец"
        static let walkTimeLabelText: String = "На прогулке еще 15 мин"
        static let isOnlineBackgroundColor: UIColor = UIColor(red: 16/255, green: 201/255, blue: 113/255, alpha: 1)
        static let isOnlineCornerRadius: CGFloat = 5
        static let isOnlineWidthHeight: CGFloat = 10
        static let mainAvatarTopPadding: CGFloat = 65
        static let namesLabelTopPadding: CGFloat = 15
        static let walkTimeLabelTopPadding: CGFloat = 5
        static let namesLabelFontSize: CGFloat = 22
        static let walkTimeLabelFontSize: CGFloat = 13
        static let textColor: UIColor = UIColor(red: 130/255, green: 138/255, blue: 150/255, alpha: 1)
        static let headerTextColor: UIColor = UIColor(red: 31/255, green: 34/255, blue: 52/255, alpha: 1)
    }
    
    private let profileBack: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backgroundProfile")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let mainAvatar: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avatarMan")?.circleMask()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let petAvatar: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avatarPetBoy")?.circleMask(color: UIColor.white.cgColor, width: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let profileSettingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(UIConstants.buttonTitle, for: .normal)
        button.layer.cornerRadius = UIConstants.buttonCornerRadius
        button.layer.cornerCurve = .continuous
        button.layer.borderWidth = UIConstants.buttonBorderWidth
        button.layer.borderColor = UIColor.gray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIConstants.buttonBackgroundColor
        return button
    }()
    
    private let profileMessageButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avatarMan")
        image.layer.masksToBounds = true
        image.backgroundColor = UIConstants.buttonBackgroundColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let namesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: UIConstants.namesLabelFontSize, weight: .semibold)
        label.text = UIConstants.nameLabelText
        label.textColor = UIConstants.headerTextColor
        return label
    }()
    
    private let walkTimeLabel: UILabel = {
        let label = UILabel()
        label.text = UIConstants.walkTimeLabelText
        label.font = .systemFont(ofSize: UIConstants.walkTimeLabelFontSize, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIConstants.textColor
        return label
    }()
    
    private let isOnline: UIView = {
        let view = UIView()
        view.backgroundColor = UIConstants.isOnlineBackgroundColor
        view.layer.cornerRadius = UIConstants.isOnlineCornerRadius
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: String) {
        // Настройка всех полей (свой/чужой профиль и данные из него)
        mainAvatar.image = UIImage(named: "testBoy")
        petAvatar.image = UIImage(named: "testPet")
    }
}

// MARK: - private methods
private extension ProfileHeaderView {
    func initialize() {
        
        addSubview(profileBack)
        addSubview(mainAvatar)
        addSubview(petAvatar)
        addSubview(profileSettingsButton)
        addSubview(profileMessageButton)
        addSubview(namesLabel)
        addSubview(walkTimeLabel)
        addSubview(isOnline)
        
        makeConstraintsProfileBack()
        makeConstraintsMainAvatar()
        makeConstraintsPetAvatar()
        makeConstraintsProfileSettingsButton()
        makeConstraintsProfileMessageButton()
        makeConstraintsNamesLabel()
        makeConstraintsWalkTimeLabel()
        makeConstraintsIsOnline()
    }
    
    private func makeConstraintsProfileBack() {
        NSLayoutConstraint.activate([
            profileBack.topAnchor.constraint(equalTo: topAnchor),
            profileBack.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileBack.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func makeConstraintsMainAvatar() {
        NSLayoutConstraint.activate([
            mainAvatar.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.mainAvatarTopPadding),
            mainAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIConstants.paddingContent),
            mainAvatar.widthAnchor.constraint(equalToConstant: UIConstants.bigAvatarSize),
            mainAvatar.heightAnchor.constraint(equalToConstant: UIConstants.bigAvatarSize),
        ])
    }
    
    private func makeConstraintsPetAvatar() {
        NSLayoutConstraint.activate([
            petAvatar.leadingAnchor.constraint(equalTo: mainAvatar.trailingAnchor, constant: -UIConstants.paddingContent),
            petAvatar.bottomAnchor.constraint(equalTo: mainAvatar.bottomAnchor),
            petAvatar.widthAnchor.constraint(equalToConstant: UIConstants.smallAvatarSize),
            petAvatar.heightAnchor.constraint(equalToConstant: UIConstants.smallAvatarSize),
        ])
    }
    
    private func makeConstraintsProfileSettingsButton() {
        NSLayoutConstraint.activate([
            profileSettingsButton.leadingAnchor.constraint(equalTo: petAvatar.trailingAnchor, constant: UIConstants.paddingContent),
            profileSettingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIConstants.paddingContent),
            profileSettingsButton.bottomAnchor.constraint(equalTo: mainAvatar.bottomAnchor),
            profileSettingsButton.heightAnchor.constraint(equalToConstant: UIConstants.buttonHeight),
        ])
    }
    
    private func makeConstraintsProfileMessageButton() {
        NSLayoutConstraint.activate([
            profileMessageButton.trailingAnchor.constraint(equalTo: profileSettingsButton.trailingAnchor),
            profileMessageButton.topAnchor.constraint(equalTo: mainAvatar.topAnchor),
            profileMessageButton.heightAnchor.constraint(equalToConstant: UIConstants.buttonHeight),
            profileMessageButton.widthAnchor.constraint(equalToConstant: UIConstants.buttonHeight),
        ])
    }
    
    private func makeConstraintsNamesLabel() {
        NSLayoutConstraint.activate([
            namesLabel.topAnchor.constraint(equalTo: mainAvatar.bottomAnchor, constant: UIConstants.namesLabelTopPadding),
            namesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIConstants.paddingContent),
        ])
    }
    
    private func makeConstraintsWalkTimeLabel() {
        NSLayoutConstraint.activate([
            walkTimeLabel.topAnchor.constraint(equalTo: namesLabel.bottomAnchor, constant: UIConstants.walkTimeLabelTopPadding),
            walkTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIConstants.paddingContent),
            walkTimeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func makeConstraintsIsOnline() {
        NSLayoutConstraint.activate([
            isOnline.topAnchor.constraint(equalTo: namesLabel.topAnchor),
            isOnline.leadingAnchor.constraint(equalTo: namesLabel.trailingAnchor),
            isOnline.widthAnchor.constraint(equalToConstant: UIConstants.isOnlineWidthHeight),
            isOnline.heightAnchor.constraint(equalToConstant: UIConstants.isOnlineWidthHeight)
        ])
    }
}

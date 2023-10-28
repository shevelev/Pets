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
        static let isOnlineBackgroundColor: UIColor = UIColor(red: 16/255, green: 201/255, blue: 113/255, alpha: 1)
        static let isNotOnlineBackgroundColor: UIColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
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
        return image
    }()
    
    private let mainAvatar: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avatarMan")?.circleMask()
        return image
    }()
    
    private let petAvatar: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avatarPetBoy")?.circleMask(color: UIColor.white.cgColor, width: 1)
        return image
    }()
    
    private let profileSettingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(UIConstants.buttonTitle, for: .normal)
        button.layer.cornerRadius = UIConstants.buttonCornerRadius
        button.layer.cornerCurve = .continuous
        button.layer.borderWidth = UIConstants.buttonBorderWidth
        button.layer.borderColor = UIColor.gray.cgColor
        button.backgroundColor = UIConstants.buttonBackgroundColor
        return button
    }()
    
    private let profileMessageButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avatarMan")
        image.layer.masksToBounds = true
        image.backgroundColor = UIConstants.buttonBackgroundColor
        return image
    }()
    
     let namesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.namesLabelFontSize, weight: .semibold)
        label.textColor = UIConstants.headerTextColor
        return label
    }()
    
    private let walkTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.walkTimeLabelFontSize, weight: .light)
        label.textColor = UIConstants.textColor
        return label
    }()
    
    private let isOnline: UIView = {
        let view = UIView()
        view.backgroundColor = UIConstants.isOnlineBackgroundColor
        view.layer.cornerRadius = UIConstants.isOnlineCornerRadius
        view.layer.masksToBounds = true
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
    
    func configure(with model: TestHuman) {
        // Настройка всех полей (свой/чужой профиль и данные из него)
        mainAvatar.image = UIImage(named: "testBoy")
        petAvatar.image = UIImage(named: "testPet")
        let namePets = model.pets![0].name!.isEmpty ? "" : "и \(model.pets![0].name ?? "")"
        namesLabel.text = "\(model.name) \(namePets)"
        isOnline.backgroundColor = model.isonline ?? false ? UIConstants.isOnlineBackgroundColor : UIConstants.isNotOnlineBackgroundColor
        walkTimeLabel.isHidden = !(model.isonline ?? false)
        walkTimeLabel.text = "На прогулке еще \(model.walktime ?? 0) мин"
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
        profileBack.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
    }
    
    private func makeConstraintsMainAvatar() {
        mainAvatar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UIConstants.mainAvatarTopPadding)
            make.leading.equalToSuperview().offset(UIConstants.paddingContent)
            make.width.height.equalTo(UIConstants.bigAvatarSize)
        }
    }
    
    private func makeConstraintsPetAvatar() {
        petAvatar.snp.makeConstraints { make in
            make.leading.equalTo(mainAvatar.snp.trailing).offset(-UIConstants.paddingContent)
            make.bottom.equalTo(mainAvatar.snp.bottom)
            make.width.height.equalTo(UIConstants.smallAvatarSize)
        }
    }
    
    private func makeConstraintsProfileSettingsButton() {
        profileSettingsButton.snp.makeConstraints { make in
            make.leading.equalTo(petAvatar.snp.trailing).offset(UIConstants.paddingContent)
            make.trailing.equalToSuperview().offset(-UIConstants.paddingContent)
            make.bottom.equalTo(mainAvatar.snp.bottom)
            make.height.equalTo(UIConstants.buttonHeight)
        }
    }
    
    private func makeConstraintsProfileMessageButton() {
        profileMessageButton.snp.makeConstraints { make in
            make.trailing.equalTo(profileSettingsButton.snp.trailing)
            make.top.equalTo(mainAvatar.snp.top)
            make.width.height.equalTo(UIConstants.buttonHeight)
        }
    }
    
    private func makeConstraintsNamesLabel() {
        namesLabel.snp.makeConstraints { make in
            make.top.equalTo(mainAvatar.snp.bottom).offset(UIConstants.namesLabelTopPadding)
            make.leading.equalToSuperview().offset(UIConstants.paddingContent)
        }
    }
    
    private func makeConstraintsWalkTimeLabel() {
        walkTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(namesLabel.snp.bottom).offset(UIConstants.walkTimeLabelTopPadding)
            make.leading.equalToSuperview().offset(UIConstants.paddingContent)
            make.bottom.equalToSuperview()
        }
    }
    
    private func makeConstraintsIsOnline() {
        isOnline.snp.makeConstraints { make in
            make.top.equalTo(namesLabel.snp.top)
            make.leading.equalTo(namesLabel.snp.trailing)
            make.width.height.equalTo(UIConstants.isOnlineWidthHeight)
        }
    }
}

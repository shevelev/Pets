//
//  ProfileHeaderCell.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 05.11.2023.
//

import UIKit

class ProfileHeaderCell: UITableViewCell {
    
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
        static let contentBackgroundColor: UIColor = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        iniialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    //MARK: - Message button
    private let messageButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "profileBackGround")
        view.layer.cornerRadius = UIConstants.buttonHeight / 2
        return view
    }()
    
    private let iconMessageButtom: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let badgeButton: UIButton = {
       let view = UIButton()
        view.layer.cornerRadius = 13 / 2
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 7)
        view.backgroundColor = UIColor(red: 250/255, green: 46/255, blue: 105/255, alpha: 1)
        view.contentEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        return view
    }()
    
    func configure(with info: MockHuman) {
        // Настройка всех полей (свой/чужой профиль и данные из него)
        mainAvatar.image = UIImage(named: "testBoy")
        petAvatar.image = UIImage(named: "testPet")
        let namePets = info.pets![0].name!.isEmpty ? "" : "и \(info.pets![0].name ?? "")"
        namesLabel.text = "\(info.name) \(namePets)"
        isOnline.backgroundColor = info.isonline ?? false ? UIConstants.isOnlineBackgroundColor : UIConstants.isNotOnlineBackgroundColor
        walkTimeLabel.isHidden = !(info.isonline ?? false)
        walkTimeLabel.text = "На прогулке еще \(info.walktime ?? 0) мин"
        
        iconMessageButtom.image = UIImage(named: "iconMessage")
        badgeButton.setTitle("666", for: .normal)
    }
}

private extension ProfileHeaderCell {
    func iniialize() {
        
        contentView.backgroundColor = UIColor(named: "profileBackGround")
        
        contentView.addSubview(profileBack)
        profileBack.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        contentView.addSubview(mainAvatar)
        mainAvatar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UIConstants.mainAvatarTopPadding)
            make.leading.equalToSuperview().offset(UIConstants.paddingContent)
            make.width.height.equalTo(UIConstants.bigAvatarSize)
        }
        
        contentView.addSubview(petAvatar)
        petAvatar.snp.makeConstraints { make in
            make.leading.equalTo(mainAvatar.snp.trailing).offset(-UIConstants.paddingContent)
            make.bottom.equalTo(mainAvatar.snp.bottom)
            make.width.height.equalTo(UIConstants.smallAvatarSize)
        }
        
        contentView.addSubview(profileSettingsButton)
        profileSettingsButton.snp.makeConstraints { make in
            make.leading.equalTo(petAvatar.snp.trailing).offset(UIConstants.paddingContent)
            make.trailing.equalToSuperview().offset(-UIConstants.paddingContent)
            make.bottom.equalTo(mainAvatar.snp.bottom)
            make.height.equalTo(UIConstants.buttonHeight)
        }
        
        contentView.addSubview(namesLabel)
        namesLabel.snp.makeConstraints { make in
            make.top.equalTo(mainAvatar.snp.bottom).offset(UIConstants.namesLabelTopPadding)
            make.leading.equalToSuperview().offset(UIConstants.paddingContent)
        }
        
        contentView.addSubview(walkTimeLabel)
        walkTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(namesLabel.snp.bottom).offset(UIConstants.walkTimeLabelTopPadding)
            make.leading.equalToSuperview().offset(UIConstants.paddingContent)
            make.bottom.equalToSuperview().inset(20)
        }
        
        contentView.addSubview(isOnline)
        isOnline.snp.makeConstraints { make in
            make.top.equalTo(namesLabel.snp.top)
            make.leading.equalTo(namesLabel.snp.trailing)
            make.width.height.equalTo(UIConstants.isOnlineWidthHeight)
        }
        
        contentView.addSubview(messageButtonView)
        messageButtonView.snp.makeConstraints { make in
            make.trailing.equalTo(profileSettingsButton.snp.trailing)
            make.top.equalTo(mainAvatar.snp.top)
            make.width.height.equalTo(UIConstants.buttonHeight)
        }
        
        messageButtonView.addSubview(iconMessageButtom)
        iconMessageButtom.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(18)
        }
        
        messageButtonView.addSubview(badgeButton)
        badgeButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.height.equalTo(13)
        }
    }
}

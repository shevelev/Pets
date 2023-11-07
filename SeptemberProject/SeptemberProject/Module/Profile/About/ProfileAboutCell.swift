//
//  ProfileAboutCell.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 05.11.2023.
//

import UIKit

class ProfileAboutCell: UITableViewCell {
    
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
        return label
    }()
    
    private let editIconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "editIcon")
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        iniialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with info: MockHuman) {
        descriptionLabel.text = info.bioAbout.isEmpty ? "Нажмите для заполнения" : info.bioAbout
        editIconImage.isHidden = !info.bioAbout.isEmpty
    }
}

private extension ProfileAboutCell {
    func iniialize() {
        
        backgroundColor = .clear
        selectionStyle = .none
        let view = UIView()
        
        contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(11)
        }
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = UIConstants.cornerRadius
        
        view.addSubview(aboutLabel)
        aboutLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(UIConstants.contentPadding)
            make.leading.equalTo(view).offset(UIConstants.contentPadding)
        }
        
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutLabel.snp.bottom).offset(UIConstants.descriptionLabelTopPadding)
            make.leading.equalTo(view).offset(UIConstants.contentPadding)
            make.trailing.equalTo(view).inset(UIConstants.contentPadding)
            make.bottom.equalTo(view).inset(UIConstants.contentPadding)
        }
        
        view.addSubview(editIconImage)
        editIconImage.snp.makeConstraints { make in
            make.top.equalTo(view).offset(UIConstants.editIconImagePadding)
            make.trailing.equalTo(view).offset(-UIConstants.editIconImagePadding)
            make.width.equalTo(UIConstants.editIconImageSize)
            make.height.equalTo(UIConstants.editIconImageSize)
        }
    }
}

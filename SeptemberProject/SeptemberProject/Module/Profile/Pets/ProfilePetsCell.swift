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
        static let cornerRadius: CGFloat = 20
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
    
    private let petAvatar: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avatarPetBoy")?.circleMask(color: UIColor.white.cgColor, width: 1)
        return image
    }()
    
    private let petNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIConstants.headerTextColor
        label.font = .systemFont(ofSize: UIConstants.petNameLabelTextSize, weight: .bold)
        return label
    }()
    
    private let petGenderImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "genderBoy")
        return image
    }()
    
    private let petLocationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "locationIcon")
        return image
    }()
    
    private let petLocationLabel: UILabel = {
        let label = UILabel()
        label.text = UIConstants.petLocationLabelText
        label.font = .systemFont(ofSize: UIConstants.petLocationLabelTextSize, weight: .light)
        label.textColor = UIConstants.textColor
        return label
    }()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private var photos: [UIImage] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with name: MockPet) {
        petAvatar.image = UIImage(named: "testPet")
        aboutLabel.text = "О питомце"
        descriptionLabel.text = name.bioAbout
        petNameLabel.text = name.name
        
        name.media?.forEach({ pet in
            photos.append(UIImage(named: pet)!)
        })
    }
}

private extension ProfilePetsCell {
    func initialize() {
        
        layer.cornerRadius = UIConstants.cornerRadius
        backgroundColor = .white
        addSubview(editIconImage)
        editIconImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UIConstants.editIconImagePadding)
            make.trailing.equalToSuperview().inset(UIConstants.editIconImagePadding)
            make.width.equalTo(UIConstants.editIconImageSize)
            make.height.equalTo(UIConstants.editIconImageSize)
        }
        
        addSubview(petAvatar)
        petAvatar.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(UIConstants.petAvatarPadding)
            make.width.height.equalTo(UIConstants.petAvatarSize)
        }
        
        let petNameAndLocationsStack = UIStackView()
        petNameAndLocationsStack.axis = .vertical
        petNameAndLocationsStack.spacing = 5
        addSubview(petNameAndLocationsStack)
        
        petNameAndLocationsStack.snp.makeConstraints { make in
            make.leading.equalTo(petAvatar.snp.trailing).offset(UIConstants.petStackViewLeadingPadding)
            make.trailing.equalToSuperview().inset(UIConstants.contentPadding)
            make.centerY.equalTo(petAvatar.snp.centerY)
        }
        let petNameAndGenderView = UIView()
        
        petNameAndGenderView.addSubview(petNameLabel)
        petNameLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
        }
        petNameAndGenderView.addSubview(petGenderImage)
        petGenderImage.snp.makeConstraints { make in
            make.leading.equalTo(petNameLabel.snp.trailing)
            make.top.equalTo(petNameLabel.snp.top)
        }
        
        let petLocationView = UIView()
        
        petLocationView.addSubview(petLocationImage)
        petLocationView.addSubview(petLocationLabel)
        
        petLocationImage.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        petLocationLabel.snp.makeConstraints { make in
            make.leading.equalTo(petLocationImage.snp.trailing).offset(UIConstants.petLocationLabelTrailingPadding)
            make.centerY.equalTo(petLocationImage.snp.centerY)
        }
        
        petNameAndLocationsStack.addArrangedSubview(petNameAndGenderView)
        petNameAndLocationsStack.addArrangedSubview(petLocationView)
        
        addSubview(aboutLabel)
        addSubview(descriptionLabel)
        
        aboutLabel.snp.makeConstraints { make in
            make.top.equalTo(petAvatar.snp.bottom).offset(UIConstants.contentPadding)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutLabel.snp.bottom).offset(UIConstants.descriptionLabelTopPadding)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        collectionView.register(ProfilePetPhotoCell.self, forCellWithReuseIdentifier: String(describing: ProfilePetPhotoCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(15)
            make.trailing.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.leading.equalToSuperview().offset(UIConstants.contentPadding)
            make.height.equalTo(UIConstants.collectionViewHeight)
        }
    }
}

extension ProfilePetsCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProfilePetPhotoCell.self), for: indexPath) as! ProfilePetPhotoCell
        let image: UIImage!
//        if indexPath.item > photos.count {
//            image = UIImage(named: "petBoy")
//        } else {
//            image = photos[indexPath.item]
//        }
        if photos.count > 0 {
            image = photos[indexPath.item]
            cell.configure(with: image)
        }
        
        return cell
    }
}

extension ProfilePetsCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 106, height: 106)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

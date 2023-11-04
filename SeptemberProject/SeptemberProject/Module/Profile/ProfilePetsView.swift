//
//  ProfilePets.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 02.10.2023.
//

import UIKit

class ProfilePetsView: UIView {
    
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
    
//    private let editIconImage: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "editIcon")
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()
    
//    private let petAvatar: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "avatarPetBoy")?.circleMask(color: UIColor.white.cgColor, width: 1)
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()
    
//    private let petNameLabel: UILabel = {
//        let label = UILabel()
//        label.text = UIConstants.petNameLabelText
//        label.textColor = UIConstants.headerTextColor
//        label.font = .systemFont(ofSize: UIConstants.petNameLabelTextSize, weight: .bold)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private let genderPetImage: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "genderBoy")
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()
    
    private let petLocationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "locationIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
//    private let petStackView: UIStackView = {
//        let view = UIStackView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.axis = .vertical
//        view.spacing = 5
//        return view
//    }()
    
    private let petLocationLabel: UILabel = {
        let label = UILabel()
        label.text = UIConstants.petLocationLabelText
        label.font = .systemFont(ofSize: UIConstants.petLocationLabelTextSize, weight: .light)
        label.textColor = UIConstants.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let petNameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let petLocationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var photos: [UIImage] = [UIImage(named: "dog21")!, UIImage(named: "dog18")!, UIImage(named: "dog20")!, UIImage(named: "dog21")! ]
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: [PetModel]) {
        // Настройка всех полей (свой/чужой профиль и данные из него)
//        petAvatar.image = UIImage(named: "testPet")

//        descriptionLabel.text = model[0].bioAbout.isEmpty ? "Нажмите для заполнения" : model[0].bioAbout
//        editIconImage.isHidden = !model[0].bioAbout.isEmpty
        
//        petNameLabel.text = model[0].name
//        descriptionLabel.text = model[0].bioAbout
    }
}

// MARK: - private methods
private extension ProfilePetsView {
    func initialize() {
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 20
        
//        addSubview(petAvatar)
//        addSubview(petStackView)
//
//        petNameView.addSubview(petNameLabel)
//        petNameView.addSubview(genderPetImage)
//
//        petLocationView.addSubview(petLocationImage)
//        petLocationView.addSubview(petLocationLabel)
//
//        petStackView.addArrangedSubview(petNameView)
//        petStackView.addArrangedSubview(petLocationView)
//
//        addSubview(aboutLabel)
//        addSubview(descriptionLabel)
//        addSubview(editIconImage)
        
//        collectionView.register(ProfilePetPhotoCell.self, forCellWithReuseIdentifier: String(describing: ProfilePetPhotoCell.self))
//        collectionView.dataSource = self
//        collectionView.delegate = self
//
//        addSubview(collectionView)
        
//        makeConstraintsPetAvatar()
//        makeConstraintsAboutLabel()
//        makeConstraintsDescriptionLabel()
//        makeConstraintsEditIconImage()
//        makeConstraintsPetStackView()
//        makeConstraintsPetNameLabel()
//        makeConstraintsPetLocationImage()
//        makeConstraintsGenderPetImage()
//        makeConstraintsCollectionView()
    }
    
//    private func makeConstraintsPetAvatar() {
//        NSLayoutConstraint.activate([
//            petAvatar.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.petAvatarPadding),
//            petAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIConstants.petAvatarPadding),
//            petAvatar.widthAnchor.constraint(equalToConstant: UIConstants.petAvatarSize),
//            petAvatar.heightAnchor.constraint(equalToConstant: UIConstants.petAvatarSize),
//        ])
//    }
//    private func makeConstraintsAboutLabel() {
//        NSLayoutConstraint.activate([
//            aboutLabel.topAnchor.constraint(equalTo: petAvatar.bottomAnchor, constant: UIConstants.contentPadding),
//            aboutLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIConstants.contentPadding),
//        ])
//    }
//    private func makeConstraintsDescriptionLabel() {
//        NSLayoutConstraint.activate([
//            descriptionLabel.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: UIConstants.descriptionLabelTopPadding),
//            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIConstants.contentPadding),
//            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIConstants.contentPadding),
//        ])
//    }
//    private func makeConstraintsEditIconImage() {
//        NSLayoutConstraint.activate([
//            editIconImage.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.editIconImagePadding),
//            editIconImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIConstants.editIconImagePadding),
//            editIconImage.widthAnchor.constraint(equalToConstant: UIConstants.editIconImageSize),
//            editIconImage.heightAnchor.constraint(equalToConstant: UIConstants.editIconImageSize),
//        ])
//    }
//    private func makeConstraintsPetStackView() {
//        NSLayoutConstraint.activate([
//            petStackView.leadingAnchor.constraint(equalTo: petAvatar.trailingAnchor, constant: UIConstants.petStackViewLeadingPadding),
//            petStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIConstants.contentPadding),
//            petStackView.centerYAnchor.constraint(equalTo: petAvatar.centerYAnchor),
//        ])
//    }
//    private func makeConstraintsPetNameLabel() {
//        NSLayoutConstraint.activate([
//            petNameLabel.topAnchor.constraint(equalTo: petNameView.topAnchor),
//            petNameLabel.bottomAnchor.constraint(equalTo: petNameView.bottomAnchor),
//            petNameLabel.leadingAnchor.constraint(equalTo: petNameView.leadingAnchor),
//            petNameLabel.trailingAnchor.constraint(equalTo: genderPetImage.leadingAnchor, constant: UIConstants.petNameLabelTrailingPadding),
//        ])
//    }
//    private func makeConstraintsPetLocationImage() {
//        NSLayoutConstraint.activate([
//            petLocationImage.topAnchor.constraint(equalTo: petLocationView.topAnchor),
//            petLocationImage.leadingAnchor.constraint(equalTo: petLocationView.leadingAnchor),
//            petLocationImage.bottomAnchor.constraint(equalTo: petLocationView.bottomAnchor),
//            petLocationLabel.leadingAnchor.constraint(equalTo: petLocationImage.trailingAnchor, constant: UIConstants.petLocationLabelTrailingPadding),
//        ])
//    }
//    private func makeConstraintsGenderPetImage() {
//        NSLayoutConstraint.activate([
//            genderPetImage.topAnchor.constraint(equalTo: petNameLabel.topAnchor, constant: -UIConstants.genderPetImageTopPadding),
//        ])
//    }
//    private func makeConstraintsCollectionView() {
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: UIConstants.contentPadding),
//            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIConstants.contentPadding),
//            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            collectionView.heightAnchor.constraint(equalToConstant: UIConstants.collectionViewHeight),
//        ])
//    }
}

extension ProfilePetsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProfilePetPhotoCell.self), for: indexPath) as! ProfilePetPhotoCell
        let image: UIImage!
        if indexPath.item > 3 {
            image = UIImage(named: "petBoy")
        } else {
            image = photos[indexPath.item]
        }
        cell.configure(with: image)
        return cell
    }
}

extension ProfilePetsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 106, height: 106)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

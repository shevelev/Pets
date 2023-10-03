//
//  ProfilePetPhotoCell.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 02.10.2023.
//

import UIKit

class ProfilePetPhotoCell: UICollectionViewCell {
    
    private enum UIConstants {
        static let imageViewCornerRadius: CGFloat = 15
    }
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = UIConstants.imageViewCornerRadius
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: UIImage!) {
        imageView.image = image
    }
}

private extension ProfilePetPhotoCell {
    func initialize() {
        contentView.addSubview(imageView)
        
        makeConstaintsImageView()
    }
    
    private func makeConstaintsImageView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

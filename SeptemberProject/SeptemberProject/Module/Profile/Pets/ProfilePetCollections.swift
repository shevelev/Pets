//
//  ProfilePetCollections.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 07.10.2023.
//

import UIKit

class ProfilePetCollections: UIView {
    
    private var pets: [TestPet] = []
    
    func configure(with model: TestHuman) {
        self.pets = model.pets ?? []
        pageControl.numberOfPages = self.pets.count
        
        collectionView.reloadData()
  }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy private var pageControl: CustomPageControl = {
        let control = CustomPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.delegate = self
        return control
    }()
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfilePetCollections {
    func initialize() {
        
        addSubview(collectionView)
        addSubview(pageControl)
        
        makeConstraintsCollectionView()
        makeConstraintsPageControl()
    }
    
    private func makeConstraintsPageControl() {
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            pageControl.bottomAnchor.constraint(equalTo: bottomAnchor),
            //pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func makeConstraintsCollectionView() {
        
        collectionView.register(ProfilePetsCell.self, forCellWithReuseIdentifier: String(describing: ProfilePetsCell.self))
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            //collectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}


extension ProfilePetCollections: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: frame.width, height: 106)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProfilePetsCell.self), for: indexPath) as! ProfilePetsCell
        let test = pets[indexPath.item]
        
        cell.configure(with: test)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.item
    }
}

extension ProfilePetCollections: CustomPageControlDelegate {
    func updateCurrentSlide(slide: Int) {
        print("slide: \(slide)")
        
            collectionView.scrollToItem(at: IndexPath(item: slide, section: 0), at: .right, animated: true)
    }
}

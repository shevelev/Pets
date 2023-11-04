//
//  ProfilePetCollections.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 07.10.2023.
//

import UIKit

class ProfilePetCollections: UIView {
    
    private var pets: [MockPet] = []
    
    func configure(with model: MockHuman) {
        self.pets = model.pets ?? []
        pageControl.numberOfPages = self.pets.count
        
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }
    
    private lazy var collectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private lazy var pageControl: CustomPageControl = {
        let control = CustomPageControl()
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

    private func makeConstraintsCollectionView() {
        collectionView.register(ProfilePetsCell.self, forCellWithReuseIdentifier: String(describing: ProfilePetsCell.self))
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(350)
           }
    }
    
    private func makeConstraintsPageControl() {
        pageControl.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(30)
        }
    }
}

extension ProfilePetCollections: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProfilePetsCell.self), for: indexPath) as! ProfilePetsCell
        let pet = pets[indexPath.item]
        
        cell.configure(with: pet)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.item
    }
}

extension ProfilePetCollections: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: frame.width, height: 350)
    }
}

extension ProfilePetCollections: CustomPageControlDelegate {
    func updateCurrentSlide(slide: Int) {
        collectionView.scrollToItem(at: IndexPath(item: slide, section: 0), at: .right, animated: true)
    }
}

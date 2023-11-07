//
//  ProfilePetsCell2.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 05.11.2023.
//

import UIKit

class ProfilePetsCell2: UITableViewCell {
    
    private var pets: [MockPet] = []
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with info: MockHuman) {
        self.pets = info.pets ?? []
        pageControl.numberOfPages = self.pets.count
        
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }
}

private extension ProfilePetsCell2 {
    func initialize() {
        selectionStyle = .none
        
        backgroundColor = .clear//UIColor(named: "profileBackGround")
        
        contentView.addSubview(collectionView)
        contentView.addSubview(pageControl)
        
        collectionView.register(ProfilePetsCell.self, forCellWithReuseIdentifier: String(describing: ProfilePetsCell.self))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(11)
//            make.trailing.equalToSuperview()
            make.height.equalTo(350)
        }
        pageControl.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(30)
            //make.bottom.equalToSuperview()
        }
        
        let viewPadding = UIView()
        contentView.addSubview(viewPadding)
        viewPadding.snp.makeConstraints { make in
            make.top.equalTo(pageControl.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.bottom.equalToSuperview()
        }
    }
}


extension ProfilePetsCell2: UICollectionViewDataSource {
    
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

extension ProfilePetsCell2: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: frame.width - 22, height: 350)
    }
}

extension ProfilePetsCell2: CustomPageControlDelegate {
    func updateCurrentSlide(slide: Int) {
        collectionView.scrollToItem(at: IndexPath(item: slide, section: 0), at: .right, animated: true)
    }
}

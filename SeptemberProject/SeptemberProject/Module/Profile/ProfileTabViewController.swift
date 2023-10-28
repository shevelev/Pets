//
//  ProfileTabViewController.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 21.09.2023.
//

import UIKit
import Foundation

class ProfileTabViewController: UIViewController {
    
    private var viewModel = ProfileTabViewModel()
    
    private enum UIConstants {
        static let contentBackgroundColor: UIColor = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1)
        static let contentTopPadding: CGFloat = 20
    }
    
    private var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = UIConstants.contentBackgroundColor
        return scroll
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let profileHeader: ProfileHeaderView = {
        let header = ProfileHeaderView()
        return header
    }()
    
    private let profileAbout: ProfileAboutView = {
        let view = ProfileAboutView()
        return view
    }()
    
    private let profilePets: ProfilePetCollections = {
        let view = ProfilePetCollections()
        return view
    }()
    
    //    private let profilePets: ProfilePetsView = {
    //        let view = ProfilePetsView()
    //        view.translatesAutoresizingMaskIntoConstraints = false
    //        return view
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIConstants.contentBackgroundColor
        
        viewModel.getUser()
        
        bindViewModel()
        setupUI()
    }
    
    private func setupUI() {
        activityIndicator.color = .blue
        
        view.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    private func bindViewModel() {
        print("bindViewModek")
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self, let isLoading else { return }
            print("isLoading: \(isLoading)")
            isLoading ?  self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            
            if !isLoading {
                self.show()
            }
        }
    }
    
    private func show() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(profileHeader)
        contentView.addSubview(profileAbout)
        contentView.addSubview(profilePets)
        
        profileHeader.configure(with: viewModel.profile!)
        profileAbout.configure(with: viewModel.profile!)
        profilePets.configure(with: viewModel.profile!)
        
        makeConstraintsScrollContent()
        makeConstraintsProfileHeader()
        makeConstraintsProfileAbout()
    }
    
    private func makeConstraintsScrollContent() {
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.centerX.equalTo(scrollView)
        }
    }
    
    private func makeConstraintsProfileHeader() {
        profileHeader.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView)
        }
    }
    
    private func makeConstraintsProfileAbout() {
        profileAbout.snp.makeConstraints { make in
            make.top.equalTo(profileHeader.snp.bottom).offset(UIConstants.contentTopPadding)
            make.leading.trailing.equalTo(contentView)
        }
        
        profilePets.snp.makeConstraints { make in
            make.top.equalTo(profileAbout.snp.bottom).offset(UIConstants.contentTopPadding)
            make.leading.trailing.bottom.equalTo(contentView)
        }
    }
}

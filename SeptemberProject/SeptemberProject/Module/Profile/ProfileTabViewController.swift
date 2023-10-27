//
//  ProfileTabViewController.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 21.09.2023.
//

import UIKit
import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class ProfileTabViewController: UIViewController {
    
    private var viewModel = ProfileTabViewModel()
    
    private enum UIConstants {
        static let contentBackgroundColor: UIColor = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1)
        static let contentTopPadding: CGFloat = 20
    }
    
    private var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = UIConstants.contentBackgroundColor
        return scroll
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profileHeader: ProfileHeaderView = {
        let header = ProfileHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    private let profileAbout: ProfileAboutView = {
        let view = ProfileAboutView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profilePets: ProfilePetCollections = {
        let view = ProfilePetCollections()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .blue
        
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
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
        
        //        if let top
        //            = UIApplication.shared.windows.first?.safeAreaInsets.top
        //        {
        //            scrollView.contentInset.top = -top
        //        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
        ])
    }
    
    private func makeConstraintsProfileHeader() {
        NSLayoutConstraint.activate([
            profileHeader.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func makeConstraintsProfileAbout() {
        NSLayoutConstraint.activate([
            profileAbout.topAnchor.constraint(equalTo: profileHeader.bottomAnchor, constant: UIConstants.contentTopPadding),
            profileAbout.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileAbout.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            profilePets.topAnchor.constraint(equalTo: profileAbout.bottomAnchor, constant: UIConstants.contentTopPadding),
            profilePets.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profilePets.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profilePets.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

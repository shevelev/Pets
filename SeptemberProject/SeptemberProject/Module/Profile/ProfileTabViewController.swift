//
//  ProfileTabViewController.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 21.09.2023.
//

import UIKit
import Foundation
import FirebaseAuth

class ProfileTabViewController: UIViewController {
    
    private enum UIConstants {
        static let contentBackgroundColor: UIColor = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1)
    }
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        //scroll.showsVerticalScrollIndicator = true
        //scroll.isDirectionalLockEnabled = true
        //scroll.showsHorizontalScrollIndicator = false
        scroll.backgroundColor = UIConstants.contentBackgroundColor
        return scroll
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profileHeader: ProfileHeader = {
        let header = ProfileHeader()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    private let profileAbout: ProfileAbout = {
        let view = ProfileAbout()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profilePets: ProfilePets = {
        let view = ProfilePets()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(profileHeader)
        contentView.addSubview(profileAbout)
        contentView.addSubview(profilePets)
        
        //mok - data
        profileHeader.configure(with: "test")
        profilePets.configure(with: "test")
        
        makeConstraintsScrollContent()
        makeConstraintsProfileHeader()
        makeConstraintsProfileAbout()
    }
    
    private func makeConstraintsScrollContent() {
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
            contentView.heightAnchor.constraint(equalToConstant: 2000)
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
            profileAbout.topAnchor.constraint(equalTo: profileHeader.bottomAnchor, constant: 20),
            profileAbout.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileAbout.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            profilePets.topAnchor.constraint(equalTo: profileAbout.bottomAnchor, constant: 20),
            profilePets.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profilePets.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            //profilePets.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

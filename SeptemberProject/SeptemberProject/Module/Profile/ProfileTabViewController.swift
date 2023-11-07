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
    
    private var tableView = UITableView()
    private var profileItems: [ProfileItemType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
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
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self, let isLoading else { return }
            isLoading ?  self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            
            if !isLoading {
                if let profile = self.viewModel.profile {
                    self.profileItems.append(.header(profile))
                    self.profileItems.append(.about(profile))
                    self.profileItems.append(.pets(profile))
                }
                self.show()
            }
        }
    }
    
    private func show() {
        
        tableView.dataSource = self
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorColor = .clear
        
        tableView.backgroundColor = UIColor(named: "profileBackGround")
        tableView.register(ProfileHeaderCell.self, forCellReuseIdentifier: String(describing: ProfileHeaderCell.self))
        tableView.register(ProfileAboutCell.self, forCellReuseIdentifier: String(describing: ProfileAboutCell.self))
        tableView.register(ProfilePetsCell2.self, forCellReuseIdentifier: String(describing: ProfilePetsCell2.self))
        view.addSubview(tableView)
        
        
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(view.frame.width)
        }
    }
}

extension ProfileTabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = profileItems[indexPath.row]
        switch item {
        case .header(let header):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileHeaderCell.self), for: indexPath) as! ProfileHeaderCell
            cell.configure(with: header)
            return cell
        case .about(let about):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileAboutCell.self), for: indexPath) as! ProfileAboutCell
            cell.configure(with: about)
            return cell
        case .pets(let pets):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfilePetsCell2.self), for: indexPath) as! ProfilePetsCell2
            cell.configure(with: pets)
            return cell
        }
    }
}

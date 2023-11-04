//
//  ProfileTabViewModel.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 30.09.2023.
//

import UIKit

protocol ProfileTabViewModelProtocol {
    var isLoading: Observable<Bool> {get}
    var profile: MockHuman? { get set }
    func getUser()
}

final class ProfileTabViewModel: ProfileTabViewModelProtocol {
    
    var isLoading: Observable<Bool> = Observable(false)

    var profile: MockHuman?
     
    func getUser() {
        isLoading.value = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            print("load")
            self.isLoading.value = false
            FirebaseClient().getFakeUser { human in
                guard let human else {return}
                self.profile = human
            }
        }
    }
}

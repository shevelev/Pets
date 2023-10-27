//
//  ProfileTabViewModel.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 30.09.2023.
//

import UIKit

protocol ProfileTabViewModelProtocol {
    var isLoading: Observable<Bool> {get}
    var profile: TestHuman? { get set }
    func getUser()
}

final class ProfileTabViewModel: ProfileTabViewModelProtocol {
    
    var isLoading: Observable<Bool> = Observable(false)

    var profile: TestHuman?
     
    func getUser() {
        isLoading.value = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2  ) {
            print("load")
            self.isLoading.value = false
            FirebaseClient().getFakeUser { testHuman in
                guard let testHuman else {return}
                self.profile = testHuman
            }
        }
    }
}

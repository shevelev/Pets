//
//  ProfileData.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 05.10.2023.
//

import Foundation


enum ViewData {
    case initial
    case loading(Data)
    
    struct Data {
        var names: String?
        //let human: Human?
        var pets: [PetTest]?
    }
    
}

struct PetTest {
    var name: String?
    var about: String?
    var age: Int?
}

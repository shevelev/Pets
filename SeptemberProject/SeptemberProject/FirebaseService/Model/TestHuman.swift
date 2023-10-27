//
//  TestHuman.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 22.10.2023.
//

import UIKit

struct TestHuman {
    var name: String
    var email: String
    var phoneNumber: String?
    var bioAbout: String = ""
    var pets: [TestPet]?
    var isonline: Bool?
    var walktime: Int?
}

struct TestPet {
    let breed: String?
    let name: String?
    let dateBirth: NSDate?
    let bioAbout: String?
    //let media: [UIImage]?
}

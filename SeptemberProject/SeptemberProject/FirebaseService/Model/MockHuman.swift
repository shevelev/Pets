//
//  MokeHuman.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 03.11.2023.
//

import Foundation


struct MockHuman {
    var name: String
    var email: String
    var phoneNumber: String?
    var bioAbout: String = ""
    var pets: [MockPet]?
    var isonline: Bool?
    var walktime: Int?
    
    static let mockHuman = MockHuman(name: "Ivan", email: "test@test.ru", bioAbout: "aboout me boout me boout me boout me boout me boout me boout me boout me boout me boout me boout me boout me boout me boout me boout me ", pets: [
        MockPet(breed: "breed 1", name: "name 1", dateBirth: NSDate(timeIntervalSinceNow: TimeInterval(10)), bioAbout: "pet 1", media: ["dog18","dog20","dog21","dog20","dog21"]),
        MockPet(breed: "breed 2", name: "name 2", dateBirth: NSDate(timeIntervalSinceNow: TimeInterval(10)), bioAbout: "pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2 pet 2", media: ["dog20","dog20","dog21","dog20","dog21"]),
        MockPet(breed: "breed 3", name: "name 3", dateBirth: NSDate(timeIntervalSinceNow: TimeInterval(10)), bioAbout: "pet 3", media: ["dog21","dog20","dog20","dog21"]),
        MockPet(breed: "breed 4", name: "name 4", dateBirth: NSDate(timeIntervalSinceNow: TimeInterval(10)), bioAbout: "pet 4", media: ["dog18","dog18","dog20","dog21"]),
    ], isonline: true, walktime: 15)
}

struct MockPet {
    let breed: String?
    let name: String?
    let dateBirth: NSDate?
    let bioAbout: String?
    let media: [String]?
}

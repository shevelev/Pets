//
//  Human.swift
//  SeptemberProject
//
//  Created by Сергей Шевелев on 04.10.2023.
//

import Foundation
import CoreLocation

struct Human {
    let name: String
    let email: String
    let location: CLLocation
    let phoneNumber: String
    let bioAbout: String
    var pets: [String]
    let isonline: Bool
    let walktime: String
}

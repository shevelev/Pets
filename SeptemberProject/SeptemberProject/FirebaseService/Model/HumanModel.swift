//
//  HumanModel.swift
//  SeptemberProject
//
//  Created by Artur Imanbaev on 06.09.2023.
//

import Foundation
import CoreLocation

struct HumanModel{
    let name: String
    let email: String
    let location: CLLocation
    let phoneNumber: String
    let bioAbout: String
    let pets: [PetModel]
    let isonline: Bool
    let walktime: String
}
//extension HumanModel{
//    static let MOCK_USER = HumanModel(name: "Igor", email: "aa@1mail.ru", location: CLLocation(latitude: 5, longitude: 5), phoneNumber: "891999999911", bioAbout: "ya igor", pets: [PetModel.MOCK_PET])
//}

//
//  HumanModel.swift
//  SeptemberProject
//
//  Created by Artur Imanbaev on 06.09.2023.
//

import Foundation
import CoreLocation
struct HumanModel{
    let id: Int
    let petIds: [Int]
    let name: String
    let email: String
    let password: String
    let location: CLLocation
    let phoneNumber: String
    let bioAbout: String
}
extension HumanModel{
    static let MOCK_USER = HumanModel(id: 10, petIds: [2,3,4], name: "Igor", email: "3411@mail.ru", password: "78391111", location: CLLocation(latitude: 5, longitude: 5), phoneNumber: "891999999911", bioAbout: "ya igor")
}

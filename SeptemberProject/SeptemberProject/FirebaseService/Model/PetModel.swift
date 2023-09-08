//
//  PetModel.swift
//  SeptemberProject
//
//  Created by Artur Imanbaev on 06.09.2023.
//

import Foundation
import UIKit
struct PetModel{
    let breed: String
    let name: String
    let dateBirth: NSDate
    let bioAbout: String
    let media: [UIImage]
}
extension PetModel{
    static let MOCK_PET = PetModel( breed: "German ovcharka", name: "Muhtar", dateBirth: NSDate(timeIntervalSinceNow: TimeInterval(10)), bioAbout: "ebannii", media: [])
}

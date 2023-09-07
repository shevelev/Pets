//
//  FirebaseClient.swift
//  SeptemberProject
//
//  Created by Artur Imanbaev on 05.09.2023.
//

import Foundation
import Firebase
import FirebaseAuth
@frozen enum DataJsonFormat{
    static let name = "name"
    static let bioAbout = "bioAbout"
    static let location = "location"
    static let petIds = "petIds"
    static let phoneNumber = "phoneNumber"
}

protocol FirebaseClientProtocol{
    func handleSignUp(withHuman human: HumanModel,withPet pet: PetModel)
    func handleSignIn(email: String, password: String)
}

final class FirebaseClient: FirebaseClientProtocol{
    let db = Firestore.firestore()
    func handleSignUp(withHuman human: HumanModel,withPet pet: PetModel) {
        Auth.auth().createUser(withEmail: human.email, password: human.password) {[weak self] authResult, error in
            if let err = error{
                print(err)
            } else{
                guard let self = self else {return}
                self.db
                    .collection("users")
                    .addDocument(data: [
                        DataJsonFormat.name: human.name,
                        DataJsonFormat.phoneNumber: human.phoneNumber,
                        DataJsonFormat.petIds: human.petIds,
                        DataJsonFormat.location: [human.location.coordinate.latitude,
                                                  human.location.coordinate.longitude
                                                 ],
                        DataJsonFormat.bioAbout: human.bioAbout,
                        "pet": [
                            pet.bioAbout,
                            pet.name,
                            pet.breed,
                            pet.dateBirth
                        ]
                    ]) { (error) in
                        if let e = error{
                            print("there was issue, \(e)")
                        } else{
                            print("succesfully saved your data")
                        }
                    }
                print("created")
            }
        }
    }
    func handleSignIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let err = error{
                print(err)
            } else{
                print("SignIn")
            }
        }
    }
    

}


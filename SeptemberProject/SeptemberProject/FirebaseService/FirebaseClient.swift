//
//  FirebaseClient.swift
//  SeptemberProject
//
//  Created by Artur Imanbaev on 05.09.2023.
//

import Foundation
import Firebase
import FirebaseAuth
@frozen enum DataJsonFormat: String{
    case name = "name"
    case bioAbout = "bioAbout"
    case location = "location"
    case petIds = "petIds"
    case phoneNumber = "phoneNumber"
    case uid = "uid"
}

protocol FirebaseClientProtocol{
    func handleSignUp(with human: HumanModel)
    func handleSignIn(with human: HumanModel, completion: @escaping(Bool) -> Void)
}

final class AuthViewModel: FirebaseClientProtocol{

    func handleSignUp(with human: HumanModel) {
        Auth.auth().createUser(withEmail:human.email, password: human.password) { result, error in
            if error != nil{
                print(error ?? "error with user")
            } else {
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: [
                    DataJsonFormat.name.rawValue: human.name,
                    DataJsonFormat.bioAbout.rawValue: human.bioAbout,
                    DataJsonFormat.location.rawValue: human.location.coordinate,
                    DataJsonFormat.petIds.rawValue: human.petIds,
                    DataJsonFormat.phoneNumber.rawValue: human.phoneNumber,
                    DataJsonFormat.uid.rawValue: result! .user.uid
                ]) { error in
                    print(error!)
                }
            }
        }
    }

    func handleSignIn(with human: HumanModel, completion: @escaping(Bool) -> Void) {
        Auth.auth().signIn(withEmail: human.email, password: human.password) { result, error in
            if let err = error{
                print(err)
            } else{
                completion(true)
            }
        }
    }
}

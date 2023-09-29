//
//  FirebaseClient.swift
//  SeptemberProject
//
//  Created by Artur Imanbaev on 05.09.2023.
//

import Foundation
import Firebase
import FirebaseAuth
@frozen enum DataHumanJsonFormat{
    static let name = "name"
    static let bioAbout = "bioAbout"
    static let location = "location"
    static let phoneNumber = "phoneNumber"
    static let pets = "pets"
}

@frozen enum DataPetJsonFormat{
    static let breed = "breed"
    static let name = "name"
    static let dateBirth = "dateBirth"
    static let bioAbout = "bioAbout"
    static let media = "media"
}

protocol FirebaseClientProtocol{
    func handleSignUp(withHuman human: HumanModel,pass: String)
    func handleSignIn(email: String, password: String, completion: @escaping (Error?)->Void)
    func resetPassword(email: String, completion: @escaping (Error?)->Void)
}

final class FirebaseClient: FirebaseClientProtocol{
    
    private let dataBase = Firestore.firestore()
    
    public func handleSignUp(withHuman human: HumanModel,pass: String) {
        Auth.auth().createUser(withEmail: human.email, password: pass) {[weak self] authResult, error in
            if let err = error{
                print(err)
            } else {
                guard let self = self else {return}
                self.createDocument(human,human.pets)
            }
        }
    }
    
    private func createDocument(_ human: HumanModel,_ pets: [PetModel]){
        
        let petsColl = dataBase.collection("pets")
        
        var petsList: [DocumentReference] = []
        
        for pet in pets {
            let uuidOfPet = UUID().uuidString
            let petsRef = petsColl.document(uuidOfPet)
            petsRef.setData([
                DataPetJsonFormat.name: pet.name,
                DataPetJsonFormat.bioAbout: pet.bioAbout,
                DataPetJsonFormat.dateBirth: pet.dateBirth,
                DataPetJsonFormat.breed: pet.breed,
                DataPetJsonFormat.media:pet.media
            ])
            petsList.append(petsRef)
        }
        dataBase
            .collection("users")
            .addDocument(data: [
                DataHumanJsonFormat.name: human.name,
                DataHumanJsonFormat.phoneNumber: human.phoneNumber,
                DataHumanJsonFormat.location: [human.location.coordinate.latitude,
                                               human.location.coordinate.longitude
                                              ],
                DataHumanJsonFormat.bioAbout: human.bioAbout,
                DataHumanJsonFormat.pets: petsList
            ]) { (error) in
                if let e = error{
                    print("there was issue, \(e)")
                } else{
                    print("succesfully saved your data")
                }
            }
    }
    
    
    
    func handleSignIn(email: String, password: String, completion: @escaping (Error?)->Void) {
        Auth.auth().signIn(
            withEmail: email,
            password: password
        ) { result, error in
            if let error = error {
                completion(error)
            } else{
                completion(nil)
            }
        }
    }
    
    func resetPassword(email: String, completion: @escaping (Error?)->Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                completion(error)
            } else{
                completion(nil)
            }
        }
    }
    
}


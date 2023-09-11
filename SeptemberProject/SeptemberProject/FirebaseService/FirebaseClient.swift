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
    func handleSignIn(email: String, password: String)
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
    
    func handleSignIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let err = error{
                print(err)
            } else{
                print("SignIn")
            }
        }
    }
//    func createUser(userFirstName: String, userLastName: String, email: String, password: String, completionBlock: @escaping (Result<UserAuthData, Error>) -> Void) {
//        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
//            if let error = error {
//                completionBlock(.failure(error))
//                return
//            } else {
//                if let currentUser = Auth.auth().currentUser?.createProfileChangeRequest() {
//                    currentUser.displayName = String("\(userFirstName) \(userLastName)")
//                    currentUser.commitChanges { [self] (error) in
//                        if let error = error {
//                            completionBlock(.failure(error))
//                        } else {
//                            if let curUser = Auth.auth().currentUser {
//                                user = UserAuthData(userFirstName: userFirstName,
//                                                    userLastName: userLastName,
//                                                    userEmail: curUser.email!,
//                                                    userPassword: password,
//                                                    uid: curUser.uid,
//                                                    userImageUrl: curUser.photoURL,
//                                                    isGoogleUser: false)
//                            }
//                            completionBlock(.success(user))
//                        }
//                    }
//                }
//            }
//        }
//    }

}


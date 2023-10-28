//
//  FirebaseClient.swift
//  SeptemberProject
//
//  Created by Artur Imanbaev on 05.09.2023.
//

import Foundation
import Firebase
import FirebaseAuth
import CoreLocation
import FirebaseStorage
import UIKit

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
    func getUser(collection: String, docName: String, completion: @escaping (Human?)->Void)
    func getImage(picName: String, completion: @escaping (UIImage) -> Void)
}

final class FirebaseClient: FirebaseClientProtocol{
    
    private let dataBase = Firestore.firestore()
    
    public func handleSignUp(withHuman human: HumanModel,pass: String) {
        Auth.auth().createUser(withEmail: human.email, password: pass) {[weak self] authResult, error in
            if let error = error{
                print(error)
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
                if let error = error{
                    print("there was issue, \(error)")
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
    
    func getUser(collection: String, docName: String, completion: @escaping (Human?) -> Void) {
        dataBase.collection(collection).document(docName).getDocument { document, error in
            guard error == nil else {completion(nil); return}
            
            let doc = Human(
                name: document?.get("name") as! String,
                email: document?.get("email") as! String,
                location: CLLocation(latitude: 0, longitude: 0),
                phoneNumber: "",
                bioAbout: document?.get("bioAbout") as! String,
                pets: document?.get("petIds") as! [String],
                isonline: document?.get("isonline") as! Bool,
                walktime: document?.get("walktime") as! String
            )
            completion(doc)
        }
    }
    
    
    func getPetsByUser(userid: String, completion: @escaping ([PetModel]?) -> Void) {
        
        let ref = dataBase.collection("pets").whereField("owner", isEqualTo: userid)
        ref.getDocuments() { (querySnapshot, err) in
            var pets: [PetModel] = []
            if let _ = err {
                completion(nil)
                return
            } else {
                for document in querySnapshot!.documents {
                    //print("\(document.documentID) => \(document.data())")
                    let pet = PetModel(
                        breed: document.get("breed") as! String,
                        name: document.get("name") as! String,
                        dateBirth: NSDate(timeIntervalSinceNow: TimeInterval(10)),
                        bioAbout: "ff",//document.get("bioAbout") as! String ,
                        media: [])
                    pets.append(pet)
                }
                completion(pets)
            }
    }
    }
    
    func getImage(picName: String, completion: @escaping (UIImage) -> Void) {
        let storage = Storage.storage()
        let reference = storage.reference()
        let pathRef = reference.child("photo")
        
        var image: UIImage = UIImage(named: "avatarMan")!
        
        let fileRef = pathRef.child(picName)
        fileRef.getData(maxSize: 1024*1024) { data, error in
            guard error == nil else {completion(image); return}
            
            image = UIImage(data: data!)!
            completion(image)
        }
    }
    
    func getFakeUser(completion: @escaping (TestHuman?) -> Void) {
        let pet1 = TestPet(breed: "breed 1", name: "name 1", dateBirth: NSDate(timeIntervalSinceNow: TimeInterval(10)), bioAbout: "good pet 1")
        let pet2 = TestPet(breed: "breed 2", name: "name 2", dateBirth: NSDate(timeIntervalSinceNow: TimeInterval(10)), bioAbout: "good pet 2")
        let pet3 = TestPet(breed: "breed 3", name: "name 3", dateBirth: NSDate(timeIntervalSinceNow: TimeInterval(10)), bioAbout: "good pet 3")
        
        let pets: [TestPet] = [pet1, pet2, pet3]
        
        let testHuman = TestHuman(name: "Ivan", email: "qweq@qwe.ru", pets: pets)
        completion(testHuman)
    }
    
}


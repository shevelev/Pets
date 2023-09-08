//
//  ViewController.swift
//  SeptemberProject
//
//  Created by Artur Imanbaev on 05.09.2023.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    let firebaseclient = FirebaseClient()
    override func viewDidLoad() {
        super.viewDidLoad()
        //firebaseclient.handleSignUp(withHuman: HumanModel.MOCK_USER, withPet: PetModel.MOCK_PET)
        firebaseclient.handleSignUp(withHuman: HumanModel.MOCK_USER,pass: "1111111")
    }
}


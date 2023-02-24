//
//  User.swift
//  MovieApp
//
//  Created by Maxim Samodurov on 19.02.2023.
//

import Foundation
import Firebase
import FirebaseAuth

struct User {
    let uidData: String
    let emailData: String
    
//     инициализтор принимает готового юзера
    init(user: FirebaseAuth.User) {
        self.uidData = user.uid
        self.emailData = user.email!
    }        
}



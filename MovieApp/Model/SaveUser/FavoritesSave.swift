//
//  FavoritesSave.swift
//  MovieApp
//
//  Created by Maxim Samodurov on 19.02.2023.
//

import Foundation
import Firebase

struct FavoritesSave {
    let title: String
    let year: String
    let genre: String
    let picture: String
    let userID: String
    let ref: DatabaseReference?
    
    init(title: String, year: String, genre: String, picture: String, userID: String) {
        self.title = title
        self.year = year
        self.genre = genre
        self.picture = picture
        self.userID = userID
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as! String
        userID = snapshotValue["userID"] as! String
        ref = snapshot.ref
        year = snapshotValue["year"] as! String
        genre = snapshotValue["genre"] as! String
        picture = snapshotValue["picture"] as! String
    }
}

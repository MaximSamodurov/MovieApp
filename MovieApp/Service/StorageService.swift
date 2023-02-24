
import Foundation
import Firebase

class StorageService {
    
    let user = Auth.auth().currentUser?.uid

    static let shared = StorageService()
        
    var favoritesObjectArray: [FavoritesObjectArray] = [] // какбудта файрбейс
        
    func store(title: String, year: String, genre: String, pic: String) {
        let ref = Database.database().reference().child("users").child(String(user!))
        ref.setValue(["title": title, "year": year, "genre": genre, "pic": pic])
    }
    
    func retrieve() {
        let ref = Database.database().reference().child("users").child(String(user!))
        ref.child("users").child(String(user!)).observe(.value) { snapshot in
            let value = snapshot.value as? NSDictionary
            let title = value?["title"] as? String ?? ""
            self.favoritesObjectArray.append(FavoritesObjectArray(title: title, year: "", genre: "", picture: ""))
        }
    }
    
//    func retrieve() -> [FavoritesObjectArray] {
//        return favoritesObjectArray
//
//    }
}

struct FavoritesObjectArray {
    let title: String
    let year: String
    let genre: String
    let picture: String
}

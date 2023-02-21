
import Foundation
import Firebase

class StorageService {
    
    let user = Auth.auth().currentUser?.uid
    
    
    static let shared = StorageService()
        
    var favoritesObjectArray: [FavoritesObjectArray] = [] // какбудта файрбейс
        
    func store(title: String, year: String, genre: String, pic: String) {
        var ref = Database.database().reference().child("users").child(String(user!))
        favoritesObjectArray.append(FavoritesObjectArray(title: title, year: year, genre: genre, picture: pic))
        ref.setValue(["title": title, "year": year, "genre": genre, "pic": pic])
    }
    
    func retrieve() -> [FavoritesObjectArray] {
        return favoritesObjectArray
    }
}

struct FavoritesObjectArray {
    let title: String
    let year: String
    let genre: String
    let picture: String
}

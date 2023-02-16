
import Foundation

class StorageService {
    
    var titles: [String] = [] // кабудта файрбес
    
    static let shared = StorageService()
    
    func store(title: String) {
        titles.append(title)
        // сохраниение в файрбейс
    }
    
    func retrive() -> [String] {
        return titles
        // тянем с файрбейс
    }
}

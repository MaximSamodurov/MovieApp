
import Foundation

class StorageService {
    
    static let shared = StorageService()
    
    var titleArray: [String] = [] // кабудта файрбес
    var yearArray: [String] = []
    var genreArray: [String] = []
    var picArray: [String] = []
    
    // сохраниение в файрбейс
    
    func store(title: String, year: String, genre: String, pic: String) {
        titleArray.append(title)
        yearArray.append(year)
        genreArray.append(genre)
        picArray.append(pic)
    }
    
    func retriveTitleArray() -> [String] {
        return titleArray
        // тянем с файрбейс
    }
    func retriveYearArray() -> [String] {
        return yearArray
        // тянем с файрбейс
    }
    func retriveGenreArray() -> [String] {
        return genreArray
        // тянем с файрбейс
    }
    func retrivePicArray() -> [String] {
        return picArray
    }
}

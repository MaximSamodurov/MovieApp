
import Foundation


struct FavoritesResult: Decodable {
    let title: String
    let plot: String
    let director: String
    let genre: String
    let actors: String
    let awards: String
    let year: String
    let poster: String
    let imdbID: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case plot = "Plot"
        case director = "Director"
        case genre = "Genre"
        case actors = "Actors"
        case awards = "Awards"
        case year = "Year"
        case poster = "Poster"
        case imdbID
    }
}

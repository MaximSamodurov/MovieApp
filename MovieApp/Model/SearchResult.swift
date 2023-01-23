import Foundation

struct SearchResult: Decodable {
    let totalResults: String
    let Search: [Search]
}

struct Search: Decodable {
    let title: String
    let year: String
    let poster: String
    var type: String
    var imdbID: String
    
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case type = "Type"
        case imdbID
    }
}

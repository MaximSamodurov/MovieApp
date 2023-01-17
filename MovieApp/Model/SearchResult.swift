import Foundation

struct SearchResult: Decodable {
    let totalResults: String
    let Search: [Search]
}

struct Search: Decodable {
    let Title: String
    let Year: String
    let Poster: String
    var type: String
    
    private enum CodingKeys: String, CodingKey {
        case Title
        case Year
        case Poster
        case type = "Type"
    }
}

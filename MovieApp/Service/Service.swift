import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchData(searchTerm: String, pagination: String, completion: @escaping ([Search], Error?) -> ()) {
        
        let url = "https://www.omdbapi.com/?i=tt3896198&apikey=1918ecd5&s=\(searchTerm)&page=\(pagination)"
        
        guard let urlString = URL(string:  url) else { return }
        
        URLSession.shared.dataTask(with: urlString) { data, response, error in

            if let error = error {
                print("error fetching", error)
                completion([], nil)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.search, nil)
                
            } catch {
                print("Failed to decode", error)
                completion([], error)
            }
        } .resume()
    }
    
    func fetchFullInfo(selectedItem: String, completion: @escaping (FullIInfoMovieResult, Error?) -> ()) {
        let url = "https://www.omdbapi.com/?i=\(selectedItem)&apikey=1918ecd5"
        
        guard let urlString = URL(string: url) else { return }
    
        URLSession.shared.dataTask(with: urlString) { data, response, error in
        
            if let error = error {
                print("error fetch", error)
            }
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(FullIInfoMovieResult.self, from: data)
                completion(searchResult, nil)
                
            } catch {
                print("Failed to decode", error)
            }
        }.resume()
    }
}



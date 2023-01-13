

import UIKit

class MovieSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        fetchItunesApps()
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    
    fileprivate func fetchItunesApps() {
        
        let url = URL(string: "https://www.omdbapi.com/?i=tt3896198&apikey=1918ecd5&t=Thrones")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("error fetching", error)
            }
            
            guard let data = data else { return }
            
            do {
                let searchResult =
                try JSONDecoder().decode(SearchResult.self, from: data)
                print(searchResult)
            } catch {
                print("failed to decode", error)
            }
        } .resume()
    }
}

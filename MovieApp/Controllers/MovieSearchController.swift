

import UIKit

class MovieSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate let cellId = "cellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
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
    
    fileprivate var appResult: SearchResult?
    
    fileprivate func fetchItunesApps() {
        
        let url = URL(string: "https://www.omdbapi.com/?i=tt3896198&apikey=1918ecd5&t=Inception")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("error fetching", error)
            }
            
            guard let data = data else { return }
            
            do {
              let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                self.appResult = searchResult
                
                print(searchResult)
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                print("Failed to decode", error)
            }
        } .resume()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 230)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.nameLabel.text = appResult?.Title
        cell.yearLabel.text = appResult?.Year
        cell.ratingLabel.text = appResult?.imdbRating
        cell.realeaseDate.text = appResult?.Released
        cell.posterImage.downloaded(from: appResult?.Poster ?? "")
        return cell
    }
    
}

